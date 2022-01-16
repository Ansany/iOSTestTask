//
//  Photo.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 16.01.2022.
//

import Foundation

struct Photo: Decodable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
}
