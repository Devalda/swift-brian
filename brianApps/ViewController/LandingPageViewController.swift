//
//  LandingPageViewController.swift
//  brianApps
//
//  Created by DEVALDA on 17/05/23.
//

import UIKit

class LandingPageViewController: UIViewController ,Coordinating{
    var coordinator: Coordinator?
    

    @IBOutlet weak var masukButton: UIButton!
    
    @IBOutlet weak var daftarButton: UIButton!
    
    var slides : [OnboardingSlide] = [ ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

//
        masukButton.layer.cornerRadius = 20
        masukButton.layer.borderWidth = 1.5
        masukButton.layer.borderColor = UIColor(red: 65.0/255.0, green: 159.0/255.0, blue: 249.0/255.0, alpha: 1.0).cgColor
//
        daftarButton.layer.cornerRadius = 20
        daftarButton.layer.borderWidth = 1.5
        daftarButton.layer.borderColor = UIColor(red: 65.0/255.0, green: 159.0/255.0, blue: 249.0/255.0, alpha: 1.0).cgColor

        // Do any additional setup after loading the view.
    }


    @IBAction func LoginAction(_ sender: Any) {
        let vc : UIViewController & Coordinating = LoginViewController()
        self.navigationController?.setViewControllers([vc], animated: true)
        
    }
    

    

}
