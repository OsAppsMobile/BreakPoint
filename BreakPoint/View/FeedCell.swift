//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 4.09.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.emailLbl.text = email
        self.contentLbl.text = content
        self.profileImage.image = profileImage
    }
    
}
