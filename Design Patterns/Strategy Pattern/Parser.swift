//
//  ParsingStrategy.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 2/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

protocol Parser {
    func parse<T>(data: Data) -> T?
}
