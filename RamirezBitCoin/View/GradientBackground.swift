//
//  GradientBackground.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/7/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//


import UIKit

extension UIView {
    
    func addVerticalGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            ColorController.buttonColor.value.cgColor,
            ColorController.darkBlue.value.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
