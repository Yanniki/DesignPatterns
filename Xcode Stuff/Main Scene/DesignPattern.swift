//
//  DesignPattern.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

enum DesignPattern: String {
    case strategy = "Strategy Pattern"
    
    var segueTitle: String {
        switch self {
        case .strategy: return "strategyPattern"
        }
    }
}
