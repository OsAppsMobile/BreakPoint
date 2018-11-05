//
//  Message.swift
//  BreakPoint
//
//  Created by Osman Dönmez on 6.09.2018.
//  Copyright © 2018 Osman Dönmez. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String
    private var _senderId: String
    
    public var content: String {
        return _content
    }
    
    public var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
