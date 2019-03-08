//
//  NetworkingErrorController.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    
    case badBaseURL(String)
    case forwardedError(Error)
    case invalidData(String)
    case badBuiltURL(String)
}
