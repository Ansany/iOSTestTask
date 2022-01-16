//
//  ULTableViewAdapter.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

final class ULTableViewAdapter: NSObject {
    
    //MARK: - Properties
    private var tableView: UITableView
    var presenter: ULViewPresenterProtocol!
    
    //MARK: - Initializator
    init(tableView: UITableView, presenter: ULViewPresenterProtocol) {
        self.tableView = tableView
        self.presenter = presenter
        super.init()
        setupTableView()
    }
    
    //MARK: - Private methods
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.UI.userCellsHeight
        tableView.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
}

//MARK: - UITableViewDataSource
extension ULTableViewAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        let user = presenter.users?[indexPath.row]
        cell.configure(with: user)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ULTableViewAdapter: UITableViewDelegate {
    
}
