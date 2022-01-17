//
//  Router.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import UIKit

final class Router: RouterProtocol {
    
    //MARK: - Properties
    var navController: UINavigationController?
    var configurator: ModuleConfigurator?
    
    //MARK: - Inicializator
    init(navController: UINavigationController, configurator: ModuleConfigurator) {
        self.navController = navController
        self.configurator = configurator
    }
    
    //MARK: - Public methods
    func showUsersListVC() {
        if let navController = navController {
            guard let usersListVC = configurator?.configureUsersListModule(with: self) else { return }
            navController.viewControllers = [usersListVC]
        }
    }
    
    func showPhotosVC(with albumID: Int) {
        if let photosVC = configurator?.configurePhotosModule(fromAID: albumID, with: self) {
            navController?.pushViewController(photosVC, animated: true)
        }
    }
    
    func showAlbumsVC(with userID: Int) {
        if let albumsVC = configurator?.configureAlbumsModule(fromUID: userID, with: self) {
            navController?.pushViewController(albumsVC, animated: true)
        }
    }
    
    func popToRoot() {
        navController?.popToRootViewController(animated: true)
    }
    
}
