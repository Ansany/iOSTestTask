//
//  PhotosViewPresenterProtocol.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import Foundation

protocol PhotosViewPresenterProtocol: AnyObject {
    init(albumId: Int, view: PhotosViewProtocol?, networkService: NetworkServiceProtocol?, router: RouterProtocol?)
    var photos: [Photo]? { get set }
    var albums: [Album]? { get set }
    func getPhotos()
}
