//
//  XMLParser.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 6/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation
import EasyXMLParser

class XMLParser: Parser {
    
    func parse<T>(data: Data) -> T? where T: Codable {
        print("oh wow. an iOS developer who's actually parsing from xml data. for \(T.self)")
        
        return nil
    }
}
