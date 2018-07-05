//
//  CoreDataStorage.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

class CoreDataStorage: Storage {
    func save<T>(_ object: T) where T: Codable {
        debugPrint("wrap object with core data")
        debugPrint("saved object with core data")
    }
}
