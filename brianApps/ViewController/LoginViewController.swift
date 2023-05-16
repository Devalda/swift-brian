//
//  LoginViewController.swift
//  brianApps
//
//  Created by DEVALDA on 16/05/23.
//

import UIKit

class LoginViewController: UIViewController,Coordinating {
    
    var coordinator: Coordinator?
    let userHardcode = "User01"
    let passHardcode = "pass01"

    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logButton: UIButton!
    
    @IBOutlet weak var userField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.stopAnimating()
        progressIndicator.hidesWhenStopped = true
//        progressIndicator.startAnimating()

    }
    
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        
        progressIndicator.startAnimating()
        logButton.isSelected = true

        if userField.text == userHardcode && passField.text == passHardcode {
           
//            fake loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {  self.progressIndicator.stopAnimating()
                self.logButton.isSelected = false
                let vc : UIViewController & Coordinating = HomePage()
                self.navigationController?.setViewControllers([vc], animated: true)
            }
              
        22
        } else {
//          fake loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { self.progressIndicator.stopAnimating()
            self.logButton.isSelected = false
         
        }

        }
        
    }


}
