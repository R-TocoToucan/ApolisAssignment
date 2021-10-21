//
//  LululemonTests.swift
//  LululemonTests
//
//  Created by Minseok Choi on 10/13/21.
//

import XCTest
import CoreData
@testable import Lululemon

class LululemonTests: XCTestCase {

    var viewModel : ListViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ListViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    func testGetGarmentCount() throws {
        viewModel?.fetchGarmentFromDB(sortIndex: 0)
        let result = self.viewModel?.getGarmentsCount()
        XCTAssertGreaterThan(result as! Int, 0)
    }
    
    func testSaveGarment() throws {
        viewModel?.db.saveData(name: "AA")
        viewModel?.fetchGarmentFromDB(sortIndex: 0)
        let result = self.viewModel?.getGarmentName(index: 0)
        XCTAssertEqual(result, "AA")
    }

    func testGetGarmentName() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel?.fetchGarmentFromDB(sortIndex: 0)

        let result = self.viewModel?.getGarmentName(index: 0)
            XCTAssertEqual(result, "AA")

        }
    
}


