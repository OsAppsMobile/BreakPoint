//
//  Group.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 13.09.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import Foundation

class Group {
    
    private var _title: String
    private var _description: String
    private var _members: [String]
    private var _key: String
    
    public var title: String {
        return _title
    }
    
    public var description: String {
        return _description
    }
    
    public var members: [String] {
        return _members
    }
    
    public var key: String {
        return _key
    }
    
    init(title: String, description: String, members: [String], key: String) {
        self._title = title
        self._description = description
        self._members = members
        self._key = key
    }
}
