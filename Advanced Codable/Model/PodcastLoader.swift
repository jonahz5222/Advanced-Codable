//
//  PodcastLoader.swift
//  Advanced Codable
//
//  Created by Jonah Zukosky on 2/14/19.
//  Copyright © 2019 Zukosky, Jonah. All rights reserved.
//

import Foundation

class PodcastLoader {
    
    class func load(jsonFileName: String) -> RSSFeed? {
        var podcasts: RSSFeed?
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.dataDecodingStrategy = .custom({ (decoder) -> Data in
//
//        })
        
        var jsonDecoder: JSONDecoder {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .custom { decoder in
                let container = try decoder.singleValueContainer()
                let dateString = try container.decode(String.self)
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
                if let date = formatter.date(from: dateString) {
                    return date
                }
                formatter.dateFormat = "yyyy-MM-dd"
                if let date = formatter.date(from: dateString) {
                    return date
                }
                throw DecodingError.dataCorruptedError(in: container,
                                                       debugDescription: "Cannot decode date string \(dateString)")
            }
            return jsonDecoder
        }
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json") {
            if let jsonData = try? Data(contentsOf: jsonFileUrl) {
                do {
                    podcasts = try jsonDecoder.decode(RSSFeed.self, from: jsonData)
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
        
        return podcasts
    }
}

//extension DateFormatter {
//    static let iso8601Full: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
//        formatter.calendar = Calendar(identifier: .iso8601)
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        return formatter
//    }()
//}
