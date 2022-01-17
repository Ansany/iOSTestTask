//
//  PhotoTableViewCell.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    static let identifier = String(describing: PhotoTableViewCell.self)
    
    //MARK: - IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Private properties
    private let networkService = NetworkService()
    private var imageURL: String?
    
    //MARK: - Public methods
    public func configurePhotoCell(with photo: Photo?) {
        activityIndicator.startAnimating()
        if let imageURL = photo?.url {
            fetchImage(with: imageURL) { image in
                if let image = image {
                    self.photoImage.image = image
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                } else {
                    self.photoImage.image = Constants.Images.errorImage
                }
            }
        }
        
        titleLabel.text = photo?.title ?? Constants.StringConstants.defaultTitle
    }
    
    //MARK: - Private methods
    func fetchImage(with urlString: String, complition: @escaping (UIImage?) -> Void) {
        networkService.fetchImage(with: urlString) { image in
            complition(image)
        }
    }
}
