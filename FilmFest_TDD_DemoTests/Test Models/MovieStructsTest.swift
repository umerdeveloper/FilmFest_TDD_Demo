//
//  MovieStructsTest.swift
//  FilmFest_TDD_DemoTests
//
//  Created by Umer Khan on 24/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import XCTest
@testable import FilmFest_TDD_Demo

class MovieStructsTest: XCTestCase {

    override func setUp() {
        // call before test run
    }

    override func tearDown() {
        // call after test run
    }
    
    // MARK: - Custom Methods
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_TestMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Romantic Comedy", releaseDate: "1987")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }
    
    
    
}
