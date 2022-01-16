//
//  ULViewProtocol.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import Foundation

//MARK: - Output
protocol ULViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}
