//
//  PhotosTableViewAdapter.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

final class PhotosTableViewAdapter: NSObject {
    
    //MARK: - Properties
    private var tableView: UITableView
    var presenter: PhotosViewPresenterProtocol?
    
    //MARK: - Initializator
    init(tableView: UITableView, presenter: PhotosViewPresenterProtocol?) {
        self.tableView = tableView
        self.presenter = presenter
        super.init()
        setupTableView()
    }
    
    //MARK: - Private methods
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.UI.photosCellsHeight
        tableView.register(UINib(nibName: PhotoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PhotoTableViewCell.identifier)
    }
}

//MARK: - UITableViewDataSource
extension PhotosTableViewAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.photos?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath) as! PhotoTableViewCell
        let photos = presenter?.photos?[indexPath.row]
        cell.configurePhotoCell(with: photos)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension PhotosTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
