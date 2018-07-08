//
//  StrategyPatternViewController.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import UIKit

fileprivate enum TestCase: Int {
    case json, xml
    
    var title: String {
        switch self {
        case .json: return "JSON"
        case .xml: return "XML"
        }
    }
    
    var url: URL? {
        switch self {
        case .json: return URL(string: "https://gist.githubusercontent.com/Yanniki/e09c6202ffe740c453ea99ffd4ac7c89/raw/79aa398a17a81bb5ab9e16626b7d213c72cd2864/test.json")
        case .xml: return URL(string: "https://gist.githubusercontent.com/Yanniki/63bf18b5a159bb4232fca0ad30e5ff36/raw/9f7dbca08ac345c7e09e1f3b60986bd6dcdc3233/test.xml")
        }
    }
}

class StrategyPatternViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionControl: UISegmentedControl!
    
    private lazy var handler: StrategyPatternHandler = {
        
        /*  These can be moved to the builder function is different manners,
            if you ever need to expand to supporting more solution.
        */
        let requester: Requester = AlamofireRequester()
        let storage: Storage = UserDefaultsStorage()
        
        return StrategyPatternHandler(with: requester, storage: storage)
    }()
    
    @IBAction func makeRequest(_ sender: Any) {
        guard let testCase = TestCase(rawValue: selectionControl.selectedSegmentIndex) else { return }
        
        executeStrategy(for: testCase)
    }
    
    private func executeStrategy(for testCase: TestCase) {
        guard let url = testCase.url,
            let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            assertionFailure("A valid url should be passed or the delegate is the wrong class")
            return
        }
        
        appDelegate.fullScreenOverlay?.isHidden = false
        
        titleLabel.isHidden = true
        
        handler.performStrategyPatternTest(with: url, parser: buildParsingStrategy(for: testCase), completion: { [weak self] success in
            appDelegate.fullScreenOverlay?.isHidden = true
            self?.titleLabel.isHidden = false
            self?.titleLabel.text = success ? "Succeeded to fetch test object for \(testCase.title) request type" : "Something went wrong, please try again"
        })
    }
    
    fileprivate func buildParsingStrategy(for testCase: TestCase) -> Parser {
        switch testCase {
        case .json: return JSONParser()
        case .xml: return YannikiXMLParser()
        }
    }
}
