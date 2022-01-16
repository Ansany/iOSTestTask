//
//  NetworkService.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getUsers(completion: @escaping (Result<[User]?, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func getUsers(completion:  @escaping (Result<[User]?, Error>) -> Void) {
        
        guard let url = Constants.DataLinks.usersURL else { return }
        
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
}
