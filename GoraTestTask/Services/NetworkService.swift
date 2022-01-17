//
//  NetworkService.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import UIKit

final class NetworkService: NetworkServiceProtocol {
    
    //MARK: - Public properties
    var imageCache = NSCache<NSString, UIImage>()
    
    //MARK: - Public methods
    public func getUsers(completion:  @escaping (Result<[User]?, Error>) -> Void) {
        
        guard let url = URL(string: Constants.DataLinks.usersURL) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([User].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        } .resume()
    }
    
    public func getAlbums(with userID: Int, completion:  @escaping (Result<[Album]?, Error>) -> Void) {
        
        guard let url = URL(string: Constants.DataLinks.usersURL + String(userID) + "/albums") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            do {
                let obj = try JSONDecoder().decode([Album].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        } .resume()
    }
    
    public func getPhotos(with albumID: Int, completion:  @escaping (Result<[Photo]?, Error>) -> Void) {
        
        guard let url = URL(string: Constants.DataLinks.photosURL + String(albumID) + "/photos") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            do {
                let obj = try JSONDecoder().decode([Photo].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        } .resume()
    }
    
    func fetchImage(with urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            completion(cachedImage)
        } else {
            guard let url = URL(string: urlString) else { return }
            let requset = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 10)
            URLSession.shared.dataTask(with: requset) { [ weak self ] data, response, error in
                
                guard error == nil, data != nil,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let self = self else { return }
                
                guard let image = UIImage(data: data!) else { return }
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                
                DispatchQueue.main.async {
                    completion(image)
                }
            } .resume()
        }
    }
}
