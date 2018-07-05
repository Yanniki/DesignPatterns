//
//  UserDefaultsStorage.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 2/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

class UserDefaultsStorage: Storage {
    func save<T>(_ object: T) where T: Codable {
        debugPrint("saved object with user defaults")
    }
}
