//
//  ViewController.swift
//  FilmFest_TDD_Demo
//
//  Created by Umer Khan on 24/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDesign()
    }
    
    
    func tableViewDesign() {
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = UIColor.clear.withAlphaComponent(0.1)
    }


}

