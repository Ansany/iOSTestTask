//
//  ModuleConfigurator.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import UIKit

final class ModuleConfigurator {
    
    func configureUsersListModule(with router: RouterProtocol) -> UIViewController {
        let view = UsersListViewController()
        let networkService = NetworkService()
        let presenter = UsersListPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter

        return view
    }
    
    func configureAlbumsModule(fromUID userID: Int, with router: RouterProtocol?) -> UIViewController? {
        let view = AlbumsListViewController()
        let networkService = NetworkService()
        let presenter = AlbumsListPresenter(userID: userID, view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func configurePhotosModule(fromAID albumId: Int, with router: RouterProtocol?) -> UIViewController? {
        let view = PhotosViewController()
        let networkService = NetworkService()
        let presenter = PhotosPresenter(albumId: albumId, view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        return view
    }
}

