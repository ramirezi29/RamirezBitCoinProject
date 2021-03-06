//
//  IRButton.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/6/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

class IRButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(.black, for: .normal)
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 9.0
        layer.masksToBounds = false
        backgroundColor = ColorController.richGold.value
        titleLabel?.font = .boldSystemFont(ofSize: 24)
        layer.cornerRadius = frame.size.height / 4
    }
}
