//
//  RegisterPageViewController.swift
//  brianApps
//
//  Created by DEVALDA on 26/05/23.
//

import UIKit
import Lottie

class RegisterPageViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    
    let animationView = LottieAnimationView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupAnimationView()
        
       
    }
    
    func setupAnimationView(){
        
        animationView.animation = LottieAnimation.named("6bf16487-f4ee-4af1-a435-406dc158c4ce")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
    }


 

}
