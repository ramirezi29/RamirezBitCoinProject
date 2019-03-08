//
//  BitcoinVC.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/6/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

class BitcoinVC: UIViewController {
    
    @IBOutlet weak var usdButton: UIButton!
    @IBOutlet weak var eurButton: UIButton!
    @IBOutlet weak var gbpButton: UIButton!
    @IBOutlet weak var idrButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var name: String?
    
    // MARK: - Life Cyles 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        updatedLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func updatedLabels() {
        instructionsLabel.text = "Select desired currency type in order to see the value per Bitcoin"
        
        // NOTE: - The if conditional statement determins what populates the nameLabel. It checks if there has been a value passed in from the SignInVC's user name textfield, if so that populates the nameLabel. If the value is nil, it will use the first and only value from our source of truth 
        
        if name != nil {
            nameLabel.text = "Hello \n\(name ?? "and Welcome to Bitcoin Converter")!"
        } else {
            nameLabel.text = "Hello \n\(NameController.shared.names[0].name)!"
        }
    }
    
    // MARK: - Actions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ConversionResultsVC else {
            return
        }
        
        switch segue.identifier {
        case Constants.SegueID.usdSegueKey:
            destinationVC.currencyValue = Currency.usdKey.rawValue
            destinationVC.currencyType = Constants.CurrencyTYpe.usd
            print("Segued on USD")
        case Constants.SegueID.eurSegueKey:
            destinationVC.currencyValue = Currency.eurKey.rawValue
            destinationVC.currencyType = Constants.CurrencyTYpe.eur
            print("Segue on Eur")
        case Constants.SegueID.gbpSegueKey:
            destinationVC.currencyValue = Currency.gbpKey.rawValue
            destinationVC.currencyType = Constants.CurrencyTYpe.gpd
            print("segue on GBP")
        case Constants.SegueID.idrSegueKey:
            destinationVC.currencyValue = Currency.idrKey.rawValue
            destinationVC.currencyType = Constants.CurrencyTYpe.idr
            print("Segue on IDR")
        default:
            break
        }
    }
}

extension BitcoinVC {
    func networkErrorAlert() {
        let errorAlertMessage = AlertController.presentAlertControllerWith(alertTitle:"There was a problem with your request" , alertMessage: "Please verify that you are connected to the internet and try again", dismissActionTitle: "OK")
        DispatchQueue.main.async {
            self.present(errorAlertMessage, animated: true, completion: nil)
        }
    }
}
