//
//  Requester.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/6/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

protocol Requester {
    func getData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}
