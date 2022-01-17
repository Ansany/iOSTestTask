//
//  AlbumsListViewController.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

class AlbumsListViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var albumsTableView: UITableView!
    
    //MARK: - Properties
    var presenter: ALViewPresenterProtocol! // input
    var adapter: ALTableViewAdapter? // setup tableView, tableViewDataSource, tableViewDelegate
    
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
        albumsTableView.isHidden = true
    }
    
    private func setupTableView() {
        adapter = ALTableViewAdapter(tableView: albumsTableView, presenter: presenter)
    }
    
    private func setupNavBar() {
        navigationItem.title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - Outputs
extension AlbumsListViewController: ALViewProtocol {
    
    // Actions after successful fetching data from internet
    func success() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.albumsTableView.isHidden = false
            self.albumsTableView.reloadData()
        }
    }
    
    // Error processing
    func failure(error: Error) {
        let controller = UIAlertController.appErrorAlert(controllerTitlte: "Error", controllerMessage: "\(error.localizedDescription)", actionTitle: "try again", cancelTitlte: "cancel") { [ weak self ] _ in
            self?.presenter.getAlbums()
        } cancelH: { [ weak self ] _ in
            self?.activityIndicator.stopAnimating()
        }
        present(controller, animated: true, completion: nil)
    }
}
