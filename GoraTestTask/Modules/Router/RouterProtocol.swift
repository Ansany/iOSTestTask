//
//  RouterProtocol.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import Foundation

protocol RouterProtocol: RouterMain {
    func showUsersListVC()
    func showPhotosVC(with albumID: Int)
    func showAlbumsVC(with userID: Int)
    func popToRoot()
}
