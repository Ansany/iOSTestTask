//
//  ALViewProtocol.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import Foundation

//MARK: - Output
protocol ALViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}
