//
//  EagleUser.swift
//  Eagle Exchange
//
//  Created by Alex Du on 12/4/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

//import Foundation
//import Firebase
//
//class EagleUser {
//    var email: String
//    var displayName: String
//    var documentID: String
//
//    var dictionary: [String: Any] {
//        return ["email": email, "displayName": displayName, "documentID": documentID ]
//    }
//
//    init(email: String, displayName: String, documentID: String) {
//        self.email = email
//        self.displayName = displayName
//        self.documentID = documentID
//    }
//
//    convenience init(user: User) {
//        self.init(email: user.email ?? "", displayName: user.displayName ?? "", documentID: user.uid)
//    }
//
//    convenience init(dictionary: [String: Any]) {
//        let email = dictionary["email"] as! String? ?? ""
//        let displayName = dictionary["displayName"] as! String? ?? ""
//        self.init(email: email, displayName: displayName, documentID: "")
//    }
//
//    func saveIfNewUser() {
//        let db = Firestore.firestore()
//        let userRef = db.collection("users").document(documentID)
//        userRef.getDocument { (document, error) in
//            guard error == nil else {
//                print("😡 ERROR: could not access document for user \(userRef.documentID)")
//                return
//            }
//            guard document?.exists == false else {
//                print("^^^ The document for user \(self.documentID) already exists. No reason to create it")
//                return
//            }
//            self.saveData()
//        }
//    }
//
//    func saveData() {
//        let db = Firestore.firestore()
//        let dataToSave: [String: Any] = self.dictionary
//        db.collection("users").document(documentID).setData(dataToSave) { error in
//            if let error = error {
//                print("😡 ERROR: \(error.localizedDescription), could not save data for \(self.documentID)")
//            }
//        }
//    }
//}
