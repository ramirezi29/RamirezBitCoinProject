//
//  Constants.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/6/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation

struct Constants {
    
    struct storyBoardConstants {
        static let isOnBoardedKey = "hasSignedIn"
        static let signInStoryBoard = "SignIn"
        static let homeScreenStoryBoard = "Main"
    }
    
    struct UserDefaults {
       static let isOnboardedKey = "hasSignedIn"
    }
    
    struct SegueID {
        static let usdSegueKey = "usdSegue"
        static let idrSegueKey = "idrSegue"
        static let gbpSegueKey = "gbpSegue"
        static let eurSegueKey = "eurSegue"
        static let loginSegueKey = "loginSegue"
    }
    
    struct CurrencyTYpe {
        static let usd = "USD"
        static let idr = "IDR"
        static let gpd = "GBP"
        static let eur = "EUR"
    }
}
