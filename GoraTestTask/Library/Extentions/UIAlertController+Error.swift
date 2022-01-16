//
//  UIAlertController+Error.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

extension UIAlertController {
    
    static func appErrorAlert(controllerTitlte: String?, controllerMessage: String?, actionTitle: String?, cancelTitlte: String?, actionH: ((UIAlertAction) -> Void)? = nil, cancelH: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        
        let alertController = UIAlertController(title: controllerTitlte, message: controllerMessage, preferredStyle: .alert)
        let reloadAction = UIAlertAction(title: actionTitle, style: .default, handler: actionH)
        let cancelAction = UIAlertAction(title: cancelTitlte, style: .destructive, handler: cancelH)
        
        alertController.addAction(cancelAction)
        alertController.addAction(reloadAction)
        
        return alertController
    }
}
