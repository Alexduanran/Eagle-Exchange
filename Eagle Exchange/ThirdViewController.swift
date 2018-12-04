//
//  ThirdViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/18/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import GoogleSignIn

class ThirdViewController: UIViewController {

    var data: Data!
    var authUI: FUIAuth!
    var name: String!
    var descriptionText: String!
    var price: String!
    
    override func viewDidLoad() {
        
        authUI = FUIAuth.defaultAuthUI()
        super.viewDidLoad()
        
//        if data == nil {
//            data = Data(user: <#T##User#>)
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        signIn()
    }
    
    func signIn() {
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            ]
        if authUI.auth?.currentUser == nil {
            self.authUI.providers = providers
            present(authUI.authViewController(), animated: true, completion: nil)
        }
    }
    
//    func updateDataFromInterface(completed: @escaping (Bool) -> ()) {
//        data.name = nameTextField.text!
//        data.description = descriptionTextView.text!
//        data.price = priceTextField.text!
//        print("new price is " + data.price)
//        completed(true)
//    }
    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    
//    @IBAction func unwindFromProductViewController(segue: UIStoryboardSegue) {
//        print("*** Unwind working")
//        let sourceViewController = segue.source as! ProductViewController
//
//        self.data.name = sourceViewController.nameTextField.text!
//        self.data.seller = fullName
//        print("***\(fullName)")
//        self.data.description = sourceViewController.descriptionTextView.text!
//        self.data.price = sourceViewController.priceTextField.text!
//        self.data.saveData {success in
//            if success {
//                self.leaveViewController()
//            } else {
//                print("*** ERROR: Couldn't leave this view controller because data wasn't saved")
//            }
//        }
//    }
}

