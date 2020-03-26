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
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDesign()
        libraryTableView.dataSource = dataService
        libraryTableView.delegate = dataService
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Thriller", releaseDate: "1979"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Adventure", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Comedy"))
        libraryTableView.reloadData()
    }
    
    
    func tableViewDesign() {
        libraryTableView.layer.cornerRadius = 20
        libraryTableView.backgroundColor = UIColor.clear.withAlphaComponent(0.1)
    }
    


}

