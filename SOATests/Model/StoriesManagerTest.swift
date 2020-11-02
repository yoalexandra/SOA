//
//  StoriesManagerTest.swift
//  SOATests
//
//  Created by Alexandra Beznosova on 16.07.2020.
//  Copyright © 2020 Alexandra Beznosova. All rights reserved.
//

import XCTest
@testable import SOA

class StoriesManagerTest: XCTestCase {
    
    var sut = StoriesManager.shared

    func testStoryManagerFetchesStorySuccessfully() {
        
        let expectedStory = [Story(title: "title", abstract: "abstract")]
        
        sut.getStories{ result in
            switch result {
            case .success(let story):
                XCTAssertEqual(story, expectedStory)
            case .failure(let error):
                XCTFail("Fetch Story should succeed, found error \(error)")
            }
        }
    }
}
