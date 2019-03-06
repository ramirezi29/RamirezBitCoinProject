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
    
    // MARK: -  Constants
    
     var disableOnBardingBool = false
  var disableOnboardingKey = "disableOnboardingKey"
    
    // MARK: - Life Cyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUserDefaults()
        
        if disableOnBardingBool == true  {
            presentMainView()
            return
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        UserDefaults.standard.set(true, forKey: Constants.UserDefaults.isOnboardedKey)
    }
    
    func loadUserDefaults(){
        disableOnBardingBool = UserDefaults.standard.bool(forKey: disableOnboardingKey)
    }
    
    // MARK: -  Actions
    
    @IBAction func singInButtonTapped(_ sender: IRButton) {
        //set user defaults
        UserDefaults.standard.set(true, forKey: Constants.UserDefaults.isOnboardedKey)
        
          presentMainView()
        //alter Bool
        
        //segue over
        
        // IN App Deleaget do some sort of check to see if the user def has been altered
    }
    
    func presentMainView() {
        let HomeStoryboard = UIStoryboard(name: Constants.storyBoardConstants.homeScreenStoryBoard, bundle: nil).instantiateInitialViewController()!
        
        UIApplication.shared.keyWindow?.rootViewController = HomeStoryboard
        
        present(HomeStoryboard, animated: true, completion: nil)
        
    }

}
