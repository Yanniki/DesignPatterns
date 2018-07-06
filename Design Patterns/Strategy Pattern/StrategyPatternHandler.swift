//
//  StrategyPatternHandler.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

class StrategyPatternHandler {
    
    private let requester: Requester
    private let storage: Storage
    
    init(with requester: Requester, storage: Storage) {
        self.requester = requester
        self.storage = storage
    }
    
    func performStrategyPatternTest(with url: URL, parser: Parser) {
        
        let completion: (Data?, Error?) -> Void = { [weak self] data, error in
            
            guard let data = data else {
                debugPrint(error.debugDescription)
                return
            }
            
            let parsedObject: TestObject? = parser.parse(data: data)
            
            self?.storage.save(parsedObject)
        }
        
        requester.getData(from: url, completion: completion)
    }
}
