//
//  ULViewPresenterProtocol.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import Foundation

//MARK: - Input
protocol ULViewPresenterProtocol: AnyObject {
    init(view: ULViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getUsers()
    var users: [User]? { get set }
    func tapOnUser(user: User?)
}
