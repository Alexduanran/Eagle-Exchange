//
//  SellerCatagoryViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/18/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import GoogleSignIn

class SellerCatagoryViewController: UIViewController {

    var data: Data!
    var authUI: FUIAuth!
//    var name: String!
//    var descriptionText: String!
//    var price: String!
    
    override func viewDidLoad() {
        authUI = FUIAuth.defaultAuthUI()
        super.viewDidLoad()
        
        if data == nil {
            data = Data()
        }
        // Do any additional setup after loading the view.
    }
    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func ticketButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowProductDetail", sender: self)
        sellerIndex = 1
    }
    
    @IBAction func eventsButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowProductDetail", sender: self)
        sellerIndex = 2
    }
    
    @IBAction func textbooksButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowProductDetail", sender: self)
        sellerIndex = 3
    }
    
    @IBAction func unwindFromProductViewController(segue: UIStoryboardSegue) {
        print("*** Unwind working")
        let sourceViewController = segue.source as! ProductViewController
        
        self.data.email = sourceViewController.emailField.text!
        self.data.name = sourceViewController.nameTextField.text!
        self.data.seller = (Auth.auth().currentUser?.displayName)!
        self.data.description = sourceViewController.descriptionTextView.text!
        self.data.price = sourceViewController.priceTextField.text!
        self.data.saveData {success in
            if success {
                self.leaveViewController()
            } else {
                print("*** ERROR: Couldn't leave this view controller because data wasn't saved")
            }
        }
    }
}
