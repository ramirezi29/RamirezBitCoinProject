//
//  NameController.swift
//  RamirezBitCoin
//
//  Created by Ivan Ramirez on 3/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation

class NameController {
    
    static var shared = NameController()
    
    var names: [Name] = []
    
    init() {
        loadFromPersistenctStorage()
    }
    
    func createUser(with name: String) {
        let newUser = Name(name: name)
        names.append(newUser)
        saveToPersistentStorage()
    }
    
    func filePath() -> URL {
        let fileManager = FileManager.default
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        guard let path = paths.first else { fatalError("Bad Path")}
        let url = path.appendingPathComponent("name.json")
        return url
    }
    
    func saveToPersistentStorage() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(names)
            print(data)
            print(String(data: data, encoding: .utf8)!)
            try data.write(to: filePath())
        } catch let error {
            print("🚀 There was an error in \(#function); \(error); \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistenctStorage() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: filePath())
            let names = try decoder.decode([Name].self, from: data)
            self.names = names
        } catch let error {
            print("🚀 There was an error in \(#function); \(error); \(error.localizedDescription) 🚀")
        }
    }
}
