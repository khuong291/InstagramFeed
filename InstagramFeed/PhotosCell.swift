//
//  PhotosCell.swift
//  InstagramFeed
//
//  Created by Khuong Pham on 11/11/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit

class PhotosCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
