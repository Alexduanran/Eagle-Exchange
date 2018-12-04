//
//  Constants.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/2/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
