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
    
    @IBOutlet weak var containerLogin: UIView!
    
    @IBOutlet weak var logButton: UIButton!
    
    @IBOutlet weak var userField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userField.layer.cornerRadius = 5.0
        userField.layer.borderWidth = 1
        userField.layer.borderColor = UIColor(red: 196.0/255.0, green: 196.0/255.0, blue: 296.0/255.0, alpha: 1.0).cgColor
        logButton.layer.cornerRadius = 20
        logButton.layer.borderWidth = 1.5
        logButton.layer.borderColor = UIColor(red: 65.0/255.0, green: 159.0/255.0, blue: 249.0/255.0, alpha: 1.0).cgColor
        containerLogin.layer.cornerRadius = 25
        containerLogin.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        

    }
    
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        logButton.isSelected = true
        userField.layer.borderWidth = 0
        
        
        
//        if userField.text == userHardcode && userField.text != ""   {
//
//            if passField.text == passHardcode
//                && passField.text != ""{
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {  self.progressIndicator.stopAnimating()
//                    self.logButton.isSelected = false
//                    let vc : UIViewController & Coordinating = HomePage()
//                    self.navigationController?.setViewControllers([vc], animated: true)
//                }
//
//            }else if (passField.text == ""){
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
//                    passField.layer.borderColor = UIColor.red.cgColor
//                    passField.layer.borderWidth = 2.0
//                    let alert = UIAlertController(title: "Password cannot be empty !", message: "try testing profile (User01,pass01)", preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
//                    present(alert, animated: true, completion: nil)
//
//                    self.progressIndicator.stopAnimating()
//                    self.logButton.isSelected = false
//                }
//            }
//            else{
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
//                    passField.layer.borderColor = UIColor.red.cgColor
//                    passField.layer.borderWidth = 2.0
//                        let alert = UIAlertController(title: "Wrong Password !", message: "try testing profile (User01,pass01)", preferredStyle: UIAlertController.Style.alert)
//                        alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
//                        present(alert, animated: true, completion: nil)
//
//                    self.progressIndicator.stopAnimating()
//                    self.logButton.isSelected = false
//                }
//
//            }
////            fake loading
//        }
//        else if(userField.text == ""){
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
//                userField.layer.borderColor = UIColor.red.cgColor
//                userField.layer.borderWidth = 2.0
//                let alert = UIAlertController(title: "Username cannot be empty !", message: "try testing profile (User01,pass01)", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
//                present(alert, animated: true, completion: nil)
//
//                self.progressIndicator.stopAnimating()
//                self.logButton.isSelected = false
//            }
//        }
//        else {
////          fake loading
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {[self] in
//
//                userField.layer.borderColor = UIColor.red.cgColor
//                userField.layer.borderWidth = 2.0
//                let alert = UIAlertController(title: "User not found !", message: "try testing profile (User01,pass01)", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//
//            self.progressIndicator.stopAnimating()
//            self.logButton.isSelected = false
//
//        }
//
//        }
//
    }


}
