//
//  UsersListViewController.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import UIKit

class UsersListViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    var presenter: ULViewPresenterProtocol! // input
    var adapter: ULTableViewAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoaded()
    }
    
    //MARK: - Private methods
    private func viewLoaded() {
        preSetup()
        setupTableView()
        setupNavBar()
    }
    
    private func preSetup() {
        activityIndicator.startAnimating()
        usersTableView.isHidden = true
    }
    
    private func setupTableView() {
        adapter = ULTableViewAdapter(tableView: usersTableView, presenter: presenter)
        usersTableView.delegate = adapter
        usersTableView.dataSource = adapter
    }
    
    private func setupNavBar() {
        navigationItem.title = "Users"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

//MARK: - Output
extension UsersListViewController: ULViewProtocol {
    func succes() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.usersTableView.isHidden = false
            self.usersTableView.reloadData()
        }
    }
    
    func failure(error: Error) {
        let controller = UIAlertController.appErrorAlert(controllerTitlte: "Error", controllerMessage: "\(error.localizedDescription)", actionTitle: "try again", cancelTitlte: "cancel") { [ weak self ] _ in
            self?.presenter.getUsers()
        } cancelH: { [ weak self ] _ in
            self?.activityIndicator.stopAnimating()
        }
        present(controller, animated: true, completion: nil)
    }
}
