//
//  StrategyPatternHandler.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

class StrategyPatternHandler {
    
    func performStrategyPatternTest(with request: Requester, parser: Parser, storage: Storage) {
        
        guard let testUrl = URL(string: "TEST URL") else { return }
        
        let completion: (Data?, Error?) -> Void = { data, error in
            
            guard let data = data else { return }
            
            let parsedObject: TestObject? = parser.parse(data: data)
            
            storage.save(parsedObject)
        }
        
        request.getData(from: testUrl, completion: completion)
    }
}
