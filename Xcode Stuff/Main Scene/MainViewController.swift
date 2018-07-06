//
//  MainViewController.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 13/5/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import UIKit

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

