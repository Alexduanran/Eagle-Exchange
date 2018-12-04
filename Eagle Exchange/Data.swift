//
//  Data.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/2/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import Foundation
import Firebase

class Data {
    
    var name: String
    var email: String
    var seller: String
    var description: String
    var price: String
    var postingUserID: String
    var documentID: String
    
    init(name: String, email: String, seller: String, description: String, price: String, postingUserID: String, documentID: String) {
        self.name = name
        self.email = email
        self.seller = seller
        self.description = description
        self.price = price
        self.postingUserID = postingUserID
        self.documentID = documentID
    }
    
    var dictionary: [String: Any] {
        return ["name": name, "email": email, "seller": seller, "description": description, "price": price, "postingUserID": postingUserID]
    }
    
    convenience init() {
        self.init(name: "", email: "", seller: "", description: "", price: "", postingUserID: "", documentID: "")
    }
    
    convenience init(dictionary: [String: Any]) {
        let name = dictionary["name"] as! String? ?? ""
        let email = dictionary["email"] as! String? ?? ""
        //let seller = dictionary["seller"] as! String? ?? ""
        let description = dictionary["description"] as! String? ?? ""
        let price = dictionary["price"] as! String? ?? ""
        let postingUserID = dictionary["postingUserID"] as! String? ?? ""
        self.init(name: name, email: email, seller: (Auth.auth().currentUser?.displayName)!, description: description, price: price, postingUserID: postingUserID, documentID: "")
    }
    
    func saveData(completed: @escaping (Bool) -> ()) {
        let db = Firestore.firestore()
        // Grab the userID
        guard let postingUserID = (Auth.auth().currentUser?.uid) else {
            print("*** ERROR: Could not save data because we don't have a valid postingUserID")
            return completed(false)
        }
        self.postingUserID = postingUserID
        // Create the dictionary representing the data we want to save
        let dataToSave = self.dictionary
        // if we HAVE saved a record, we'll have a documentID
        if sellerIndex == 1 {
            if self.documentID != "" {
                let ref = db.collection("ticketListItems").document(self.documentID)
                ref.setData(dataToSave) { (error) in
                    if let error = error {
                        print("*** ERROR: updating document \(self.documentID) \(error.localizedDescription)")
                        completed(false)
                    } else {
                        print("Document updated with ref ID \(ref.documentID)")
                        completed(true)
                    }
                }
            } else {
                var ref: DocumentReference? = nil // Let firestore create the new documentID
                ref = db.collection("ticketListItems").addDocument(data: dataToSave) { error in
                    if let error = error {
                        print("*** ERROR: creating new document \(error.localizedDescription)")
                        completed(false)
                    } else {
                        print("^^^ new document created with ref ID \(ref?.documentID ?? "unknown ")")
                        self.documentID = ref!.documentID
                        completed(true)
                    }
                }
            }
        } else if sellerIndex == 2 {
            if self.documentID != "" {
                let ref = db.collection("eventsListItems").document(self.documentID)
                ref.setData(dataToSave) { (error) in
                    if let error = error {
                        print("*** ERROR: updating document \(self.documentID) \(error.localizedDescription)")
                        completed(false)
                    } else {
                        print("Document updated with ref ID \(ref.documentID)")
                        completed(true)
                    }
                }
            } else {
                var ref: DocumentReference? = nil // Let firestore create the new documentID
                ref = db.collection("eventsListItems").addDocument(data: dataToSave) { error in
                    if let error = error {
                        print("*** ERROR: creating new document \(error.localizedDescription)")
                        completed(false)
                    } else {
                        print("^^^ new document created with ref ID \(ref?.documentID ?? "unknown ")")
                        self.documentID = ref!.documentID
                        completed(true)
                    }
                }
            }
        } else if sellerIndex == 3 {
            if self.documentID != "" {
                let ref = db.collection("textbooksListItems").document(self.documentID)
                ref.setData(dataToSave) { (error) in
                    if let error = error {
                        print("*** ERROR: updating document \(self.documentID) \(error.localizedDescription)")
                        completed(false)
                    } else {
                        print("Document updated with ref ID \(ref.documentID)")
                        completed(true)
                    }
                }
            } else {
                var ref: DocumentReference? = nil // Let firestore create the new documentID
                ref = db.collection("textbooksListItems").addDocument(data: dataToSave) { error in
                    if let error = error {
                        print("*** ERROR: creating new document \(error.localizedDescription)")
                        completed(false)
                    } else {
                        print("^^^ new document created with ref ID \(ref?.documentID ?? "unknown ")")
                        self.documentID = ref!.documentID
                        completed(true)
                    }
                }
            }
        }
        
        
    }
    
}

