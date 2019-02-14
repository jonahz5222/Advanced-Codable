//
//  FoodLoader.swift
//  Advanced Codable
//
//  Created by Jonah Zukosky on 2/14/19.
//  Copyright © 2019 Zukosky, Jonah. All rights reserved.
//

import Foundation

class FoodLoader {
    
    class func load(jsonFileName: String) -> [Food]? {
        var food: [Food]?
        let jsonDecoder = JSONDecoder()
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json") {
            if let jsonData = try? Data(contentsOf: jsonFileUrl) {
                do {
                    food = try jsonDecoder.decode([Food].self, from: jsonData)
                } catch let error {
                    print("bad decoding")
                    print(error)
                }
            } else {
                print("bad data")
            }
        } else {
            print("bad url")
        }
        
        return food
    }
}
