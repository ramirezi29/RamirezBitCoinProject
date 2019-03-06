//
//  BitcoinVC.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/6/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

class BitcoinVC: UIViewController {
    
    
    @IBOutlet var usdButton: IRButton!
    @IBOutlet var eurButton: IRButton!
    @IBOutlet var gbpButton: IRButton!
    @IBOutlet var idrButton: IRButton!
    @IBOutlet var bitcoinValueView: UIView!
    @IBOutlet weak var dissmissBCValueButton: UIButton!
    @IBOutlet weak var bitcoinValueLabel: UILabel!
    @IBOutlet weak var localCurrencyLabel: UILabel!
    
    let networkErrorMessage = "Please check that you are connected to the internet and try again"
    let networkErrorTitleMessage = "There was a problem with your request"
    let usdCurrency = "BTCUSD"
    let euroCurrency = "BTCEUR"
    let gbpCurrency = "BTCGBP"
    let idrCurrency = "BTCIDR"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - UI
        bitcoinValueView.layer.cornerRadius = 5
    }
    
    func animateOutOfBCValueView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.bitcoinValueView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.bitcoinValueView.alpha = 0
        }) { (success: Bool) in
            self.bitcoinValueView.removeFromSuperview()
        }
    }
    
    func animateInBCValueView() {
        self.view.addSubview(self.bitcoinValueView)
        self.bitcoinValueView.backgroundColor = .cyan 
        self.bitcoinValueView.layer.borderWidth = 4
        self.bitcoinValueView.layer.borderColor = UIColor.black.cgColor
        self.bitcoinValueView.center = self.view.center
        
        self.bitcoinValueView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.bitcoinValueView.alpha = 0
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4) {
                self.bitcoinValueView.alpha = 1
                self.bitcoinValueView.transform =  CGAffineTransform.identity
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func dissmissButtonTapped(_ sender: UIButton) {
        animateOutOfBCValueView()
    }
    
    @IBAction func usdButtonTapped(_ sender: IRButton) {
        BitcoinValueController.fetchBitcoin(with: usdCurrency) { (bitcoin, _) in
            if bitcoin != nil {
                guard let bitcoin = bitcoin else {
                    return
                }
                print(bitcoin.ask)
            } else {
                self.networkErrorAlert()
            }
        }
    }
    
    @IBAction func eurButtonTapped(_ sender: IRButton) {
        animateInBCValueView()
        BitcoinValueController.fetchBitcoin(with: euroCurrency) { (bitcoin, _) in
            if bitcoin != nil {
                guard let bitcoin = bitcoin else {
                    return
                }
                print(bitcoin.ask)
            } else {
                self.networkErrorAlert()
            }
        }
    }
    
    @IBAction func gbpButtonTapped(_ sender: IRButton) {
        BitcoinValueController.fetchBitcoin(with: gbpCurrency) { (bitcoin, _) in
            if bitcoin != nil {
                guard let bitcoin = bitcoin else {
                    return
                }
                print(bitcoin.ask)
            } else {
                self.networkErrorAlert()
            }
        }
    }
    
    @IBAction func idrButtonTapped(_ sender: IRButton) {
        BitcoinValueController.fetchBitcoin(with: idrCurrency) { (bitcoin, _) in
            if bitcoin != nil {
                guard let bitcoin = bitcoin else {
                    return
                }
                print(bitcoin.ask)
            } else {
                self.networkErrorAlert()
            }
        }
    }
}

extension BitcoinVC {
    func networkErrorAlert() {
        let errorAlertMessage = AlertController.presentAlertControllerWith(alertTitle:"There was a problem with your request" , alertMessage: "Please check that you are connected to the internet and try again", dismissActionTitle: "OK")
        DispatchQueue.main.async {
            self.present(errorAlertMessage, animated: true, completion: nil)
        }
    }
}
