//
//  UserTableViewCell.swift
//  GoraTestTask
//
//  Created by Andrey Alymov on 17.01.2022.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: UserTableViewCell.self)
    
    //MARK: - IBOutlets
    @IBOutlet weak var userNameLabel: UILabel!
    
    //MARK: - Public methods
    public func configure(with user: User?){
        userNameLabel.text = user?.name
    }
}
