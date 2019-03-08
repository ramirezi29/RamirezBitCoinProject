//
//  AppDelegate.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let isOnboarded = UserDefaults.standard.bool(forKey: Constants.storyBoardConstants.isOnBoardedKey)
        
        if isOnboarded {
            let storyboard = UIStoryboard(name: Constants.storyBoardConstants.homeScreenStoryBoard, bundle: nil)
            window?.rootViewController = storyboard.instantiateInitialViewController()
        } else {
            let storyboard = UIStoryboard(name: Constants.storyBoardConstants.signInStoryBoard, bundle: nil)
            window?.rootViewController = storyboard.instantiateInitialViewController()
        }
        window?.makeKeyAndVisible()
        
        return true
    }
}

