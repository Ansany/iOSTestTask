//
//  RouterMain.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

protocol RouterMain {
    var navController: UINavigationController? { get set }
    var configurator: ModuleConfigurator? { get set }
    init(navController: UINavigationController, configurator: ModuleConfigurator)
}
