//
//  ALViewPresenterProtocol.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import Foundation

//MARK: - Input
protocol ALViewPresenterProtocol: AnyObject {
    init(userID: Int, view: ALViewProtocol?, networkService: NetworkServiceProtocol?, router: RouterProtocol?)
    func getAlbums()
    var albums: [Album]? { get set }
    func tapOnAlbum(with albumID: Int)
}
