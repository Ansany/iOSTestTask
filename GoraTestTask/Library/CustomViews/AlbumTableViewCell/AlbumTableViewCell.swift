//
//  AlbumTableViewCell.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    static let identifier = String(describing: AlbumTableViewCell.self)
    
    //MARK: - IBOutlets
    @IBOutlet weak var albumNameLabel: UILabel!
    
    //MARK: - Public methods
    public func configure(with album: Album?, number: Int){
        albumNameLabel.text = "\(number). \(album?.title ?? Constants.StringConstants.defaultTitle)"
    }
}
