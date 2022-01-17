//
//  PhotosPresenter.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import Foundation

final class PhotosPresenter: PhotosViewPresenterProtocol {
   
    //MARK: - Properties
    weak var view: PhotosViewProtocol?
    var networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    var albumId: Int
    var albums: [Album]?
    var photos: [Photo]?
    
    //MARK: - Inicializator
    required init(albumId: Int, view: PhotosViewProtocol?, networkService: NetworkServiceProtocol?, router: RouterProtocol?) {
        self.view = view
        self.albumId = albumId
        self.networkService = networkService
        self.router = router
        getPhotos()
    }
    
    //MARK: - Public methods
    
    // Fetching photos with ID from jsonplaceholder.typicode.com
    func getPhotos() {
        networkService?.getPhotos(with: albumId) { [ weak self ] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case.success(let photos):
                    self.photos = photos
                    self.view?.success()
                case.failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
