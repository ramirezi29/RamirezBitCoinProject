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
        view.addVerticalGradientLayer()
        loadUserDefaults()
        
        if disableOnBardingBool == true  {
            presentMainView()
            return
        }
        
        let hideKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        view.addGestureRecognizer(hideKeyboardTap)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        UserDefaults.standard.set(true, forKey: Constants.UserDefaults.isOnboardedKey)
    }
    
    func loadUserDefaults(){
        disableOnBardingBool = UserDefaults.standard.bool(forKey: disableOnboardingKey)
    }
    
    func presentMainView() {
        let HomeStoryboard = UIStoryboard(name: Constants.storyBoardConstants.homeScreenStoryBoard, bundle: nil).instantiateInitialViewController()!
        UIApplication.shared.keyWindow?.rootViewController = HomeStoryboard
        present(HomeStoryboard, animated: true, completion: nil)
    }
    
    @objc func hideKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Constants.SegueID.loginSegueKey {
            
            if nameTextField.text == nil || nameTextField.text == "" {
                userNameErrorAlert()
                return false
            }
        }
        presentMainView()
        UserDefaults.standard.set(true, forKey: Constants.UserDefaults.isOnboardedKey)
        guard let name = nameTextField.text, !name.isEmpty else {
            return false
        }
        NameController.shared.createUser(with: name)
        return true
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        guard let distinationVC = segue.destination as? BitcoinVC else {
            return
        }
        distinationVC.name = name
    }
}

extension SignInVC {
    func userNameErrorAlert() {
        let userNameErrorAlertMessage = AlertController.presentAlertControllerWith(alertTitle:"Invalid Username" , alertMessage: "Username can not be left blank, please enter in a valid username", dismissActionTitle: "OK")
        DispatchQueue.main.async {
            self.present(userNameErrorAlertMessage, animated: true, completion: nil)
        }
    }
}
