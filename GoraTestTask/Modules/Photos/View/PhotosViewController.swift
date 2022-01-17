//
//  PhotosViewController.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var photosTableView: UITableView!
    
    //MARK: - Properties
    var presenter: PhotosViewPresenterProtocol? // input
    var adapter: PhotosTableViewAdapter? // setup tableView, tableViewDataSource, tableViewDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoaded()
    }

    //MARK: - Private methods
    private func viewLoaded() {
        setupTableView()
        setupNavBar()
    }
    
    private func setupTableView() {
        adapter = PhotosTableViewAdapter(tableView: photosTableView, presenter: presenter)
    }
    
    private func setupNavBar() {
        navigationItem.title = "Photos"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - Outputs
extension PhotosViewController: PhotosViewProtocol {
    
    // Update tableView after successful fetching data from internet
    func success() {
        DispatchQueue.main.async {
            self.photosTableView.reloadData()
        }
    }
    
    // Error processing
    func failure(error: Error) {
        let controller = UIAlertController.appErrorAlert(controllerTitlte: "Error", controllerMessage: "\(error.localizedDescription)", actionTitle: "try again", cancelTitlte: "cancel", cancelH:  { [ weak self ] _ in
            self?.presenter?.getPhotos()
        })
        present(controller, animated: true, completion: nil)
    }
}
