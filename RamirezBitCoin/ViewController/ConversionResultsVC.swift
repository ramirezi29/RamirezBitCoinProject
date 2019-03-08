//
//  conversionResultsVC.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/7/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

class ConversionResultsVC: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var currencyValueLabel: UILabel!
    
    private var observer: NSObjectProtocol?
    var currencyValue: String?
    var currencyType: String?
    
    // MARK: - Life Cyles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.backgroundColor = .clear
        activityIndicator.color = ColorController.darkBlue.value
        showActivityIndicator()
        view.addVerticalGradientLayer()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        clearValueLabels()
        NotificationCenter.default.removeObserver(self)
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: .main) { [ self] notification in
            self.navigationController?.popViewController(animated: false)
        }
        
        headingLabel.text = "Current Bitcoin Value"
        
        guard let currencyValue = currencyValue,
            let currencyType = currencyType else {
                return
        }
        
        // NOTE: - The network call is fed a string value from the previous view controller 
        
        BitcoinValueController.fetchBitcoin(with: currencyValue) { (bitcoin, _) in
            if bitcoin != nil {
                guard let bitcoin = bitcoin else {
                    return
                }
                self.hideActivityIndicator()
                DispatchQueue.main.async {
                    self.title = currencyType
                    self.currencyValueLabel.text = "\(bitcoin.ask) \(currencyType)"
                }
            } else {
                DispatchQueue.main.async {
                    self.title = ""
                }
                self.networkErrorAlert()
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        clearValueLabels()
    }
    
    func clearValueLabels() {
        currencyValueLabel.text = ""
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
        }
    }
    
    
    @objc func appMovedToForeground() {
        print("App moved to ForeGround!")
    }
}

extension ConversionResultsVC {
    
    func networkErrorAlert() {
        let errorAlertMessage = AlertController.presentAlertControllerWith(alertTitle:"There was a problem with your request" , alertMessage: "Please check that you are connected to the internet and try again", dismissActionTitle: "OK")
        DispatchQueue.main.async {
            self.present(errorAlertMessage, animated: true, completion: nil)
        }
    }
}
