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
        
        if data == nil {
            data = Data()
        }
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
    
    @IBAction func signOutButtonPressed(_ sender: UIBarButtonItem) {
        do {
            try authUI!.signOut()
            print("^^^ Successfully signed out!")
            signIn()
        } catch {
            print("*** ERROR: Couldn't sign out")
        }
    }
    
    @IBAction func unwindFromProductViewController(segue: UIStoryboardSegue) {
        let sourceViewController = segue.source as! ProductViewController
        print(sellerIndex)
        if sellerIndex == 1 {
            ticketListItems.append(EventDetail(name: sourceViewController.nameTextField.text!, seller: "Alex", description: sourceViewController.descriptionTextView.text!, price: sourceViewController.priceTextField.text!))
        } else if sellerIndex == 2 {
            eventsListItems.append(EventDetail(name: sourceViewController.nameTextField.text!, seller: "Alex", description: sourceViewController.descriptionTextView.text!, price: sourceViewController.priceTextField.text!))
        } else if sellerIndex == 3 {
            textbooksListItems.append(EventDetail(name: sourceViewController.nameTextField.text!, seller: "Alex", description: sourceViewController.descriptionTextView.text!, price: sourceViewController.priceTextField.text!))
        }
        
            self.data.name = sourceViewController.nameTextField.text!
            self.data.description = sourceViewController.descriptionTextView.text!
            self.data.price = sourceViewController.priceTextField.text!
            self.data.saveData {success in
                if success {
                    print("save data called and it's successful")
                    self.leaveViewController()
                } else {
                    print("*** ERROR: Couldn't leave this view controller because data wasn't saved")
                }
            }
    }
}

