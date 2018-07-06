//
//  StrategyPatternViewController.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import UIKit

fileprivate enum TestCase {
    case xml, json
    
    var url: URL? {
        switch self {
        case .xml: return URL(string: "https://gist.githubusercontent.com/Yanniki/63bf18b5a159bb4232fca0ad30e5ff36/raw/9f7dbca08ac345c7e09e1f3b60986bd6dcdc3233/test.xml")
        case .json: return URL(string: "https://gist.githubusercontent.com/Yanniki/e09c6202ffe740c453ea99ffd4ac7c89/raw/79aa398a17a81bb5ab9e16626b7d213c72cd2864/test.json")
        }
    }
}

class StrategyPatternViewController: UIViewController {
    
    //can at any time swap implementations with NSURLSession
    private let requester: Requester = AlamofireRequester()
    private let storage: Storage = UserDefaultsStorage()
    
    fileprivate func buildStrategy(for testCase: TestCase) {
        
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
