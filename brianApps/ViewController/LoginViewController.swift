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
        userField.layer.cornerRadius = 10.0
        passField.layer.cornerRadius = 10.0
        

    }
    
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        
        progressIndicator.startAnimating()
        logButton.isSelected = true
        passField.layer.borderWidth = 0
        userField.layer.borderWidth = 0
        
        
        
        if userField.text == userHardcode && userField.text != ""   {

            if passField.text == passHardcode
                && passField.text != ""{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {  self.progressIndicator.stopAnimating()
                    self.logButton.isSelected = false
                    let vc : UIViewController & Coordinating = HomePage()
                    self.navigationController?.setViewControllers([vc], animated: true)
                }
                
            }else if (passField.text == ""){
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                    passField.layer.borderColor = UIColor.red.cgColor
                    passField.layer.borderWidth = 2.0
                    let alert = UIAlertController(title: "Password cannot be empty !", message: "try testing profile (User01,pass01)", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
                    present(alert, animated: true, completion: nil)
                    
                    self.progressIndicator.stopAnimating()
                    self.logButton.isSelected = false
                }
            }
            else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                    passField.layer.borderColor = UIColor.red.cgColor
                    passField.layer.borderWidth = 2.0
                        let alert = UIAlertController(title: "Wrong Password !", message: "try testing profile (User01,pass01)", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
                        present(alert, animated: true, completion: nil)
                        
                    self.progressIndicator.stopAnimating()
                    self.logButton.isSelected = false
                }
            
            }
//            fake loading
        }
        else if(userField.text == ""){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                userField.layer.borderColor = UIColor.red.cgColor
                userField.layer.borderWidth = 2.0
                let alert = UIAlertController(title: "Username cannot be empty !", message: "try testing profile (User01,pass01)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
                present(alert, animated: true, completion: nil)
                
                self.progressIndicator.stopAnimating()
                self.logButton.isSelected = false
            }
        }
        else {
//          fake loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {[self] in
                
                userField.layer.borderColor = UIColor.red.cgColor
                userField.layer.borderWidth = 2.0
                let alert = UIAlertController(title: "User not found !", message: "try testing profile (User01,pass01)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            self.progressIndicator.stopAnimating()
            self.logButton.isSelected = false
         
        }

        }
        
    }


}
