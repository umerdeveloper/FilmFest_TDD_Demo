//
//  ViewController.swift
//  FilmFest_TDD_Demo
//
//  Created by Umer Khan on 24/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDesign()
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
    }
    
    
    func tableViewDesign() {
        libraryTableView.layer.cornerRadius = 20
        libraryTableView.backgroundColor = UIColor.clear.withAlphaComponent(0.1)
    }
    


}

