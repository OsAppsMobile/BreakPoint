//
//  MeFeedCell.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 14.09.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit

class MeFeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.emailLbl.text = email
        self.messageLbl.text = content
        self.profileImg.image = profileImage
    }
    
}
