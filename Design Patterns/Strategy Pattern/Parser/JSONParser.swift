//
//  JSONParser.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 2/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

class JSONParser: Parser {
    
    private let jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
    }
    
    func parse<T>(data: Data) -> T? where T: Codable {
        print("parsing from json data for \(T.self)")
        
        return try? jsonDecoder.decode(T.self, from: data)
    }
}
