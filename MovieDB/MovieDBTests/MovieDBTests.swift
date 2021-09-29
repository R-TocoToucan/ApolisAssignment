//
//  MovieDBTests.swift
//  MovieDBTests
//
//  Created by Minseok Choi on 9/24/21.
//

import XCTest
@testable import MovieDB

var loginVC : MovieListViewController?

class MovieDBTests: XCTestCase {

    override func setUp() {
        loginVC = MovieListViewController()
    }
    override func tearDown() {
        loginVC = nil
    }
    

}
