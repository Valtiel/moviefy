//
//  TVResourceTests.swift
//  moviefyTests
//
//  Created by César Rosales on 2/9/18.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import XCTest
import SwiftyJSON

class TVResourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSingleObjectRequest() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        let expectation = XCTestExpectation(description: "")
//        let resourceFactory = TVResource()
//        let resource = resourceFactory.tvShow(id: "1")
//        resource.request(.get).onSuccess() { data in
//            print(data.content)
//            guard let tvShow : TVShow = data.typedContent() else {
//                return
//            }
//            print(tvShow)
//            expectation.fulfill()
//        }.onFailure { requestError in
//            print(requestError)
//        }
//        wait(for: [expectation], timeout: 10.0)
    }
    
    func testArrayRequest() {
//        let expectation = XCTestExpectation(description: "")
//        let resourceFactory = TVResource()
//        let resource = resourceFactory.onTheAir();
//        resource.request(.get).onSuccess() { data in
//            print(data.content)
//            guard let tvShowsArray : [TVShow] = data.typedContent() else {
//                return
//            }
//            print(tvShowsArray)
//            expectation.fulfill()
//        }.onFailure { requestError in
//            print(requestError)
//        }
//        wait(for: [expectation], timeout: 10.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
