//
//  BitCoinNetworkController.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation

class BitcoinValueController {
    //https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD
    
    static let baseURL = URL(string: "https://apiv2.bitcoinaverage.com")
    
    private init(){}
    
    
    static func fetchBitcoin(with localCurrency: String, completion: @escaping (BitcoinValue?, NetworkingError?) -> Void) {
        
        guard var url = baseURL else {
            completion(nil, .badBaseURL("Error with base URL"))
            return
        }
        
        url.appendPathComponent("indices")
        url.appendPathComponent("global")
        url.appendPathComponent("ticker")
        url.appendPathComponent(localCurrency)
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        guard let builtURL = components?.url else {
            completion(nil, .badBuiltURL("Error with the built URL"))
            return
        }
        
        print("\nThis is the Built URL: \(builtURL)\n")
        
        URLSession.shared.dataTask(with: builtURL) { (data, _, error) in
            if let error = error {
                print("\n\n🚀 There was an error with dataTask getting the launches from the endpoint in: \(#file) \n\n \(#function); \n\n\(error); \n\n\(error.localizedDescription) 🚀\n\n"); completion(nil, .forwardedError(error))
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
                print("\n\n🍕 There was an error with decoding the data  in: \(#file) \n\n \(#function); \n\n\(error); \n\n\(error.localizedDescription) 🍕 \n\n")
                completion(nil, .forwardedError(error))
                return
            }
            }.resume()
    }
}
