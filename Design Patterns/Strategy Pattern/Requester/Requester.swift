//
//  Requester.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/6/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

/**
    Protocol for different web request implementations (Alamofire, URLSession, etc)
 */
protocol Requester {
    func getData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}
