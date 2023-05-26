//
//  MainCoordinator.swift
//  brianApps
//
//  Created by DEVALDA on 16/05/23.
//

import Foundation
import UIKit

class MainCoordinator:Coordinator{
    var navigationController: UINavigationController?
    
    
    func start() {

        var vc : UIViewController & Coordinating = RegisterPageViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)


    }
    
}
