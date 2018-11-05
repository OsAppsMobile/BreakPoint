//
//  GroupCell.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 7.09.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitle: UILabel!
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var groupMembers: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitle.text = title
        self.groupDescription.text = title
        self.groupMembers.text = "\(memberCount) members."
    }

}
