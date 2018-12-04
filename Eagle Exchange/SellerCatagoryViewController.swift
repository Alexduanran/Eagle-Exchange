//
//  SellerCatagoryViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/18/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit

class SellerCatagoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
}
