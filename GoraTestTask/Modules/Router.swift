//
//  Router.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import UIKit

protocol RouterMain {
    var navController: UINavigationController? { get set }
    var configurator: ModuleConfigurator? { get set }
    init(navController: UINavigationController, configurator: ModuleConfigurator)
}

protocol RouterProtocol: RouterMain {
    func showUsersListVC()
}

final class Router: RouterProtocol {

    var navController: UINavigationController?
    var configurator: ModuleConfigurator?
    
    init(navController: UINavigationController, configurator: ModuleConfigurator) {
        self.navController = navController
        self.configurator = configurator
    }
    
    func showUsersListVC() {
        if let navController = navController {
            guard let usersListVC = configurator?.configureUsersListModule(with: self) else { return }
            navController.viewControllers = [usersListVC]
        }
    }
    
    
    
}
