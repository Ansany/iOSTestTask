//
//  PhotosViewProtocol.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import Foundation

protocol PhotosViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}
