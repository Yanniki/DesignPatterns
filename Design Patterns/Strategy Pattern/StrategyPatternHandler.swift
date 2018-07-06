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
    
    init(with requester: Requester) {
        self.requester = requester
    }
    
    func performStrategyPatternTest(with url: URL, parser: Parser, storage: Storage) {
        
        guard let testUrl = URL(string: "TEST URL") else { return }
        
        let completion: (Data?, Error?) -> Void = { data, error in
            
            guard let data = data else { return }
            
            let parsedObject: TestObject? = parser.parse(data: data)
            
            storage.save(parsedObject)
        }
        
        requester.getData(from: testUrl, completion: completion)
    }
}
