//
//  Requester.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/6/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation
import UIKit

protocol Requester {
    
    var decoder: JSONDecoder { get }
    
    func get<T: Codable>(from url: URL, completion: @escaping (T?, Error?) ->Void)
    func getImage(from url: URL, completion: @escaping (UIImage?, Error?) ->Void)
}
