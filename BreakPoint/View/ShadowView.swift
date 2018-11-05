//
//  ShadowView.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 22.08.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }

}
