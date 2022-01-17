//
//  ALTableViewAdapter.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

final class ALTableViewAdapter: NSObject {
    
    //MARK: - Properties
    private var tableView: UITableView
    var presenter: ALViewPresenterProtocol!
    
    //MARK: - Initializator
    init(tableView: UITableView, presenter: ALViewPresenterProtocol) {
        self.tableView = tableView
        self.presenter = presenter
        super.init()
        setupTableView()
    }
    
    //MARK: - Private methods
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.UI.albumsCellsHeight
        tableView.register(UINib(nibName: AlbumTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AlbumTableViewCell.identifier)
    }
}

//MARK: - UITableViewDataSource
extension ALTableViewAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.albums?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as! AlbumTableViewCell
        let album = presenter.albums?[indexPath.row]
        cell.configure(with: album, number: indexPath.row + 1)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ALTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = presenter?.albums?[indexPath.row].id else { return }
        presenter?.tapOnAlbum(with: id)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
