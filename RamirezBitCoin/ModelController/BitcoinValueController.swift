//
//  BitCoinNetworkController.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation

class BitcoinValueController {
    
    static let baseURL = URL(string: "https://apiv2.bitcoinaverage.com")
    
    static func fetchBitcoin(with currencyType: String, completion: @escaping (BitcoinValue?, NetworkingError?) -> Void) {
        
        guard var url = baseURL else {
            completion(nil, .badBaseURL("Error with base URL"))
            return
        }
        
        url.appendPathComponent("indices")
        url.appendPathComponent("global")
        url.appendPathComponent("ticker")
        url.appendPathComponent(currencyType)
        
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        guard let builtURL = components?.url else {
            completion(nil, .badBuiltURL("Error with the built URL"))
            return
        }
        
        URLSession.shared.dataTask(with: builtURL) { (data, _, error) in
            if let error = error {
                print("\nThere was an error with dataTask getting the bitcoin value from the endpoint in: \(#file)\n\(#function);\n\(error);\n\(error.localizedDescription)\n"); completion(nil, .forwardedError(error))
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidData("Invalid Data"))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let fetchedBitcoinValue = try jsonDecoder.decode(BitcoinValue.self, from: data)
                completion(fetchedBitcoinValue, nil)
            } catch {
                print("\nThere was an error decoding the data in: \(#file)\n \(#function);\n\(error);\n\(error.localizedDescription)\n")
                completion(nil, .forwardedError(error))
                return
            }
            }.resume()
    }
}
