//
//  RequestURLTest.swift
//  SOATests
//
//  Created by Alexandra Beznosova on 16.07.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//
import XCTest
@testable import SOA

class RequestURLTest: XCTestCase {
    
    var sut: RequestURL!

    func testFetchTopStoriesRequestSuccessfully() {
        
        sut = .stories

        XCTAssertEqual(sut.url, "https://api.nytimes.com/svc/topstories/v2/world.json")
        XCTAssertEqual(sut.method, .get)

        switch sut.parameters {
        case .url(let url):
            XCTAssertEqual(url, ["api-key": "uXvUwtprWyPIvJ5hWPvCR6KCDdATV5A3"])
        default:
            XCTFail("Expected url parameters")
        }
      
    }
}
