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
}

