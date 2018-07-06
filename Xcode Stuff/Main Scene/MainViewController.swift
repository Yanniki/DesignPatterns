//
//  MainViewController.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 13/5/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import UIKit

fileprivate enum TestCaseUrl {
    case xml, json
    
    var url: URL? {
        switch self {
        case .xml: return URL(string: "https://gist.githubusercontent.com/Yanniki/63bf18b5a159bb4232fca0ad30e5ff36/raw/9f7dbca08ac345c7e09e1f3b60986bd6dcdc3233/test.xml")
        case .json: return URL(string: "https://gist.githubusercontent.com/Yanniki/e09c6202ffe740c453ea99ffd4ac7c89/raw/79aa398a17a81bb5ab9e16626b7d213c72cd2864/test.json")
        }
    }
}

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = MainDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pattern = dataSource.designPatterns[indexPath.row]
        
        performSegue(withIdentifier: pattern.segueTitle, sender: nil)
    }
}

