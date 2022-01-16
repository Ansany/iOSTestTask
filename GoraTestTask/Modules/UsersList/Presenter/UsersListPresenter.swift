//
//  UsersListPresenter.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import Foundation

final class UsersListPresenter: ULViewPresenterProtocol {

    //MARK: - Properties
    weak var view: ULViewProtocol? //output
    var router: RouterProtocol?
    var networkService: NetworkServiceProtocol!
    var users: [User]?
    
    //MARK: - Initializer
    required init(view: ULViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.networkService = networkService
        getUsers()
    }
    
    //MARK: - Fetching data from jsonplaceholder.typicode.com
    func getUsers() {
        networkService.getUsers { [ weak self ] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case.success(let users):
                    self.users = users
                    self.view?.succes()
                case.failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    //MARK: - User's actions
    func tapOnUser(user: User?) {
        print("User was tapped")
    }
    
}
