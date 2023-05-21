//
//  LoginViewController.swift
//  brianApps
//
//  Created by DEVALDA on 16/05/23.
//

import UIKit
import PhoneNumberKit


class LoginViewController: UIViewController,Coordinating {
    

    var coordinator: Coordinator?
    let userHardcode = "08123456789"

    
    
    @IBOutlet weak var containerLogin: UIView!
    
    @IBOutlet weak var logButton: UIButton!
    
    @IBOutlet weak var phoneField:PhoneNumberTextField!
    
    let phoneNumberKit = PhoneNumberKit()
    
    override func viewDidLoad() {

        
        let infoButton = UIBarButtonItem(image:UIImage(systemName: "questionmark.circle.fill"), style: .done, target: self, action: #selector(showInfo(sender: )))
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward") ,style: .done, target: self, action: #selector(backToLandingPage(sender:)))
        
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = infoButton
        self.navigationController!.navigationBar.tintColor = .white
        
//
        phoneField.layer.cornerRadius = 5.0
        phoneField.layer.borderWidth = 1
        phoneField.layer.borderColor = UIColor(red: 196.0/255.0, green: 196.0/255.0, blue: 296.0/255.0, alpha: 1.0).cgColor
        logButton.layer.cornerRadius = 20
        logButton.layer.borderWidth = 1.5
        logButton.layer.borderColor = UIColor(red: 65.0/255.0, green: 159.0/255.0, blue: 249.0/255.0, alpha: 1.0).cgColor
        containerLogin.layer.cornerRadius = 25
        containerLogin.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]


    }
    
    @IBAction func onPhoneNumberChanged(_ sender: Any) {

            if (phoneField.text?.count ?? 0 < 15) {
                phoneField.text = PartialFormatter().formatPartial(phoneField.text ?? "")
            } else {
                phoneField.deleteBackward()
            }


        }

    @objc func backToLandingPage(sender: UIBarButtonItem) {
        let transition = CATransition()
        let vc : UIViewController & Coordinating = LandingPageViewController()
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.setViewControllers([vc], animated: false)
    }
    
    @objc func showInfo(sender :UIBarButtonItem){
        
    }

    @IBAction func didPressLogin(sender: AnyObject) {
        
        logButton.isSelected = true
        phoneField.layer.borderWidth = 0
        
        if phoneField.text == userHardcode && phoneField.text != ""   {


//                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.logButton.isSelected = false
                    let vc : UIViewController & Coordinating = HomePage()
                    self.navigationController?.setViewControllers([vc], animated: true)
                

//            }
            
//            fake loading
        }
        else if(phoneField.text == nil){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                phoneField.layer.borderColor = UIColor.red.cgColor
                phoneField.layer.borderWidth = 2.0
                let alert = UIAlertController(title: "Phonenumber cannot be empty !", message: "try testing profile using : (\(userHardcode))", preferredStyle: UIAlertController.Style.alert)
//                alert.setValue(UIColor.red, forKey: "titleTextColor")
                alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
                present(alert, animated: true, completion: nil)
                self.logButton.isSelected = false
            }
        }
        else {
//          fake loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {[self] in

                phoneField.layer.borderColor = UIColor.red.cgColor
                phoneField.layer.borderWidth = 2.0
                let alert = UIAlertController(title: "User not found !", message: "try testing profile using : (\(userHardcode))", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "try again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)

            self.logButton.isSelected = false

        }

        }

    }


}
