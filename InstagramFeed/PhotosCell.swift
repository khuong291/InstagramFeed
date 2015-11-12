//
//  PhotosCell.swift
//  InstagramFeed
//
//  Created by Khuong Pham on 11/11/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit

class PhotosCell: UITableViewCell {

    @IBOutlet var avatarUserImageView: UIImageView!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
