//
//  FriendsTableViewCell.swift
//  clientVK
//
//  Created by S D on 04.05.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    static let reuseIdentifier = "FriendsTableViewCell"
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(name: String?, image: UIImage?)   {
        nameCell.text = name
        imageViewCell.image = image
    }


}
