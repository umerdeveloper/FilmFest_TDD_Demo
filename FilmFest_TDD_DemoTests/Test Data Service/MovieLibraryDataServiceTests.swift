//
//  MovieLibraryDataServiceTests.swift
//  FilmFest_TDD_DemoTests
//
//  Created by Umer Khan on 24/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import XCTest
@testable import FilmFest_TDD_Demo

class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    
    let fairyTale = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")
    

    override func setUp() {
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        libraryTableView = UITableView()
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    // MARK: - Sections
    func testTableViewSections_Count_ReturnsTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    func testTableViewSections_SectionOne_ReturnsMovieToSeeCount() {
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        sut.movieManager?.addMovie(movie: thriller)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
        
    }
    func testTableViewSections_SectionTwo_ReturnsMovieSeenCount() {
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: darkComedy)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
        
    }

}
