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
    var adapter: ULTableViewAdapter? // setup tableView, tableViewDataSource, tableViewDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoaded()
    }
    
    //MARK: - Private methods
    private func viewLoaded() {
        initialSetup()
        setupTableView()
        setupNavBar()
    }
    
    private func initialSetup() {
        activityIndicator.startAnimating()
        usersTableView.isHidden = true
    }
    
    private func setupTableView() {
        adapter = ULTableViewAdapter(tableView: usersTableView, presenter: presenter)
    }
    
    private func setupNavBar() {
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - Outputs
extension UsersListViewController: ULViewProtocol {
    
    // Actions after successful fetching data from internet
    func success() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.usersTableView.isHidden = false
            self.usersTableView.reloadData()
        }
    }
    
    // Error processing
    func failure(error: Error) {
        let controller = UIAlertController.appErrorAlert(controllerTitlte: "Error", controllerMessage: "\(error.localizedDescription)", actionTitle: "try again", cancelTitlte: "cancel") { [ weak self ] _ in
            self?.presenter.getUsers()
        } cancelH: { [ weak self ] _ in
            self?.activityIndicator.stopAnimating()
        }
        present(controller, animated: true, completion: nil)
    }
}
