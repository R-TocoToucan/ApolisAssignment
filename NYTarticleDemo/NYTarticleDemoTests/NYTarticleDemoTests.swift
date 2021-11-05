//
//  NYTarticleDemoTests.swift
//  NYTarticleDemoTests
//
//  Created by Minseok Choi on 10/15/21.
//

import XCTest
@testable import NYTarticleDemo

class NYTarticleDemoTests: XCTestCase {
    
    var viewModel: ArticleViewModel?
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ArticleViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testGetRowCount() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = expectation(description: "expectation")
        viewModel?.getDataFromServer(completionHandler: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 10000) { error in
            XCTAssertGreaterThan(self.viewModel?.getRowCount() as! Int, 0)
        }
    }

    func testGetTitle() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = expectation(description: "expectation")
        viewModel?.getDataFromServer(completionHandler: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 10000) { error in
            XCTAssertNotNil(self.viewModel?.getTitle(index: 0))
        }
    }
    
    func testGetAbstract() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = expectation(description: "expectation")
        viewModel?.getDataFromServer(completionHandler: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 10000) { error in
            XCTAssertNotNil(self.viewModel?.getAbstract(index: 0))
        }
    }

}
