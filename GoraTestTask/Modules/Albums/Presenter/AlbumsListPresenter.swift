//
//  AlbumsListPresenter.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import Foundation

final class AlbumsListPresenter: ALViewPresenterProtocol {

    //MARK: - Properties
    weak var view: ALViewProtocol? //output
    var router: RouterProtocol?
    var networkService: NetworkServiceProtocol?
    var userID: Int
    var albums: [Album]?
    
    //MARK: - Initializer
    required init(userID: Int, view: ALViewProtocol?, networkService: NetworkServiceProtocol?, router: RouterProtocol?) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.userID = userID
        getAlbums()
    }
    
    //MARK: - Public methods
    
    // Fetching albums from jsonplaceholder.typicode.com
    public func getAlbums() {
        networkService?.getAlbums(with: userID) { [ weak self ] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case.success(let albums):
                    self.albums = albums
                    self.view?.success()
                case.failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    //MARK: - User's actions
    func tapOnAlbum(with albumID: Int) {
        router?.showPhotosVC(with: albumID)
    }
    
}
