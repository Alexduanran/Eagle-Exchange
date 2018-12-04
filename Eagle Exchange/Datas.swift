//
//  Datas.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/3/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import Foundation
import Firebase

class Datas {
    var dataArray = [Data]()
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(completed: @escaping () -> ())  {
        if buyerIndex == 1 {
            db.collection("ticketListItems").addSnapshotListener { (querySnapshot, error) in
                guard error == nil else {
                    print("*** ERROR: adding the snapshot listener \(error!.localizedDescription)")
                    return completed()
                }
                self.dataArray = []
                // there are querySnapshot!.documents.count documents in teh spots snapshot
                for document in querySnapshot!.documents {
                    // You'll have to be sure you've created an initializer in the singular class (Spot, below) that acepts a dictionary.
                    let data = Data(dictionary: document.data())
                    data.documentID = document.documentID
                    self.dataArray.append(data)
                }
                completed()
            }
        } else if buyerIndex == 2 {
            db.collection("eventsListItems").addSnapshotListener { (querySnapshot, error) in
                guard error == nil else {
                    print("*** ERROR: adding the snapshot listener \(error!.localizedDescription)")
                    return completed()
                }
                self.dataArray = []
                // there are querySnapshot!.documents.count documents in teh spots snapshot
                for document in querySnapshot!.documents {
                    // You'll have to be sure you've created an initializer in the singular class (Spot, below) that acepts a dictionary.
                    let data = Data(dictionary: document.data())
                    data.documentID = document.documentID
                    self.dataArray.append(data)
                }
                completed()
            }
        } else if buyerIndex == 3 {
            db.collection("textbooksListItems").addSnapshotListener { (querySnapshot, error) in
                guard error == nil else {
                    print("*** ERROR: adding the snapshot listener \(error!.localizedDescription)")
                    return completed()
                }
                self.dataArray = []
                // there are querySnapshot!.documents.count documents in teh spots snapshot
                for document in querySnapshot!.documents {
                    // You'll have to be sure you've created an initializer in the singular class (Spot, below) that acepts a dictionary.
                    let data = Data(dictionary: document.data())
                    data.documentID = document.documentID
                    self.dataArray.append(data)
                }
                completed()
            }
        }
        
        
    }
}
