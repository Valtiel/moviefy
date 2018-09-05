//
//  moviefyTests.swift
//  moviefyTests
//
//  Created by César Rosales on 01/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import XCTest
@testable import moviefy

class moviefyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.¥
        let expectation = XCTestExpectation(description: "")

        let resource = theMovieDBAPI.latestMovies()
        resource.request(.get).onSuccess() { data in
            let updatedState = data.jsonDict
            print(updatedState)
            expectation.fulfill()
        }.onFailure { requestError in
            print(requestError)
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
