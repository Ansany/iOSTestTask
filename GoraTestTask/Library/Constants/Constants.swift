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
    }
    
    enum DataLinks {
        static let baseURL = URL(string: "https://jsonplaceholder.typicode.com/")
        static let usersURL = URL(string: "https://jsonplaceholder.typicode.com/users")
    }
}
