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
    
    //MARK: - Public methods
    
    // Fetching users from jsonplaceholder.typicode.com
    public func getUsers() {
        networkService.getUsers { [ weak self ] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case.success(let users):
                    self.users = users
                    self.view?.success()
                case.failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    //MARK: - User's actions
    public func tapOnUser(with userID: Int) {
        router?.showAlbumsVC(with: userID)
    }
    
}
