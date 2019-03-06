//
//  SignInVC.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/6/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var signInButton: IRButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: -  Actions
    
    @IBAction func singInButtonTapped(_ sender: IRButton) {
        //set user defaults
        
        //alter Bool
        
        //segue over
        
        // IN App Deleaget do some sort of check to see if the user def has been altered
    }

}
