//
//  FirstViewController.swift
//  Eagle Exchange
//
//  Created by Alex Du on 11/15/18.
//  Copyright © 2018 Alex Du. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import GoogleSignIn

class FirstViewController: UIViewController {

    @IBOutlet weak var ticketButton: UIButton!
    @IBOutlet weak var eventsButton: UIButton!
    @IBOutlet weak var textbooksButton: UIButton!
    
    var authUI: FUIAuth!
//    var eagleUser: EagleUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ticketButton.layer.cornerRadius = 8
        eventsButton.layer.cornerRadius = 8
        textbooksButton.layer.cornerRadius = 8
        
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
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

    @IBAction func ticketsButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowIndividualLists", sender: self)
        buyerIndex = 1
    }
    
    @IBAction func eventsButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowIndividualLists", sender: self)
        buyerIndex = 2
    }
    
    @IBAction func textbooksButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowIndividualLists", sender: self)
        buyerIndex = 3
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
}


extension FirstViewController: FUIAuthDelegate {
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if let user = user {
            // Assumes data will be isplayed in a tableView that was hidden until login was verified so unauthorized users can't see data.
            print("^^^ We signed in with the user \(user.email ?? "unknown e-mail")")
        }
    }
    
//    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
//        let loginViewController = FUIAuthPickerViewController(authUI: authUI)
//        loginViewController.view.backgroundColor = UIColor.white
//
//        let marginInsets: CGFloat = 16
//        let imageHeight: CGFloat = 225
//        let imageY = self.view.center.y - imageHeight
//        let logoFrame = CGRect(x: self.view.frame.origin.x + marginInsets, y: imageY, width: self.view.frame.width - (marginInsets*2), height: imageHeight)
//        let logoImageView = UIImageView(frame: logoFrame)
//        logoImageView.image = UIImage(named: "logo")
//        logoImageView.contentMode = .scaleAspectFit
//        loginViewController.view.addSubview(logoImageView)
//        return loginViewController
//    }
}

