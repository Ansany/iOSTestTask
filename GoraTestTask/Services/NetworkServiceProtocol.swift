//
//  NetworkServiceProtocol.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

protocol NetworkServiceProtocol {
    func getUsers(completion: @escaping (Result<[User]?, Error>) -> Void)
    func getAlbums(with userID: Int, completion: @escaping (Result<[Album]?, Error>) -> Void)
    func getPhotos(with albumID: Int, completion:  @escaping (Result<[Photo]?, Error>) -> Void)
    var imageCache: NSCache<NSString, UIImage> { get set }
    func fetchImage(with url: String, completion: @escaping (UIImage?) -> Void)
}
