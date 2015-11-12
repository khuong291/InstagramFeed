//
//  DetailPhotosCell.swift
//  InstagramFeed
//
//  Created by Khuong Pham on 11/12/15.
//  Copyright © 2015 Fantageek. All rights reserved.
//

import UIKit

class DetailPhotosCell: UITableViewCell {


    @IBOutlet var userCommentContentTextView: UITextView!
    @IBOutlet var userCommentNameLabel: UILabel!
    @IBOutlet var avatarUserCommentImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
