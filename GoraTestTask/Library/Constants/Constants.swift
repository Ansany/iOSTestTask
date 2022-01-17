//
//  Constants.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import UIKit

struct Constants {
    
    enum StringConstants {
        static let defaultName = "emptyName"
        static let defaultTitle = "emptyTitle"
    }
    
    enum Images {
        static let errorImage: UIImage = UIImage.init(named: "errorImage")!
    }
    
    enum UI {
        static let userCellsHeight: CGFloat = 55
        static let albumsCellsHeight: CGFloat = 60
        static let photosCellsHeight: CGFloat = 370
    }
    
    enum DataLinks {
        static let baseURL = "https://jsonplaceholder.typicode.com/"
        static let usersURL = "https://jsonplaceholder.typicode.com/users/"
        static let photosURL = "https://jsonplaceholder.typicode.com/albums/"
    }
}
