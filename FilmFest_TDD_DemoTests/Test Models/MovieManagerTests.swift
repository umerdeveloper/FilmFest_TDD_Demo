//
//  MovieManagerTests.swift
//  FilmFest_TDD_DemoTests
//
//  Created by Umer Khan on 24/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import XCTest
@testable import FilmFest_TDD_Demo

class MovieManagerTests: XCTestCase {
    var sut: MovieManager!
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
     let actionMovie = Movie(title: "Action/Adventure")

    override func setUp() {
        sut = MovieManager()
    }
    override func tearDown() {
    }
    
    // MARK: - Custom Methods
    
    //MARK: - Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: - Add and Query
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: scifiMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testInit_ReturnsMovieAtIndex() {
        sut.addMovie(movie: arthouseMovie)
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(arthouseMovie .title, movieQueried.title)
    }
    //MARK: - Checking Off
    func testOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        
    }
    func testOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: arthouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
        
        
    }

}
