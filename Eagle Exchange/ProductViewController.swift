//
//  ProductViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/18/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit
import Firebase

class ProductViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var publishBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    var name: String!
    var descriptionText: String!
    var price: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = name
        descriptionTextView.text = descriptionText
        priceTextField.text = price
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromPublish" {
            name = nameTextField.text
            descriptionText = descriptionTextView.text
            price = priceTextField.text
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "UnwindFromSave" {
//            let destination = segue.destination as! EventsListViewController
//            destination.eventNameLabel.text = nameTextField.text
//            destination.eventDescriptionLabel.text = descriptionTextView.text
//            destination.eventPriceLabel.text = priceTextField.text
//        }
//    }
    
    func leaveViewController() {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        leaveViewController()
    }
    
//    @IBAction func publishButtonPressed(_ sender: UIBarButtonItem) {
//        print("publish button pressed")
//        updateDataFromInterface { (result) in
//            print("Calling save data")
//            self.data.saveData {success in
//                if success {
//                    print("save data called and it's successful")
//                    self.leaveViewController()
//                } else {
//                    print("*** ERROR: Couldn't leave this view controller because data wasn't saved")
//                }
//            }
//        }
//    }
    
}
