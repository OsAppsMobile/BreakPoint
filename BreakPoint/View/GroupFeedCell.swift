//
//  GroupFeedCell.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 14.09.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    
    func configureCell(profileImg: UIImage, userEmail: String, message: String) {
        self.userEmailLbl.text = userEmail
        self.messageLbl.text = message
        self.profileImg.image = profileImg
    }
    
    
}
