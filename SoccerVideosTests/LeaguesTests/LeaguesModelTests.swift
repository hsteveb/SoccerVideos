//
//  LeaguesModelTests.swift
//  SoccerVideosTests
//
//  Created by Hector Barrios on 7/11/21.
//

import XCTest
@testable import SoccerVideos

class LeaguesModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    /* make sure initialization works with a nil response value.*/
    func testInitializeLeagueModel() throws {
        let league = LeaguesModel()
        XCTAssert(league.response == nil, "Should be nil")
    }
    
    

}
