//
//  EagleUsers.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/4/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import Foundation
import Firebase

class EagleUsers {
    var eagleUserArray = [EagleUser]()
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completed: @escaping () -> ())  {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard error == nil else {
                print("*** ERROR: adding the snapshot listener \(error!.localizedDescription)")
                return completed()
            }
            self.eagleUserArray = []
            // there are querySnapshot!.documents.count documents in teh spots snapshot
            for document in querySnapshot!.documents {
                let eagleUser = EagleUser(dictionary: document.data())
                print("*****\(eagleUser)")
                eagleUser.documentID = document.documentID
                self.eagleUserArray.append(eagleUser)
            }
            completed()
        }
    }
}
