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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions
    
 
    
    @IBAction func usdButtonTapped(_ sender: IRButton) {
        // do something
    }
    
    @IBAction func eurButtonTapped(_ sender: IRButton) {
        // do something
    }
    
    @IBAction func gbpButtonTapped(_ sender: IRButton) {
        // do something
    }
    
    @IBAction func idrButtonTapped(_ sender: IRButton) {
        
    }

}
