//
//  MainDataSource.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/7/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import UIKit

class MainDataSource: NSObject, UITableViewDataSource {
    
    private let cellIdentifier: String = "DesignPattern"
    
    let designPatterns: [DesignPattern] = [.strategy]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return designPatterns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = designPatterns[indexPath.row].rawValue
        
        return cell
    }
}
