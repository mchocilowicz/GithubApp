//
//  ProfileViewControllerTests.swift
//  GithubAppTests
//
//  Created by Marcin on 26/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import XCTest

class ProfileViewControllerTests: XCTestCase
{
    
    override func setUp()
    {
        super.setUp()
        
    }
    
    func waitForResponse()
    {
        let expectation = XCTestExpectation(description: "test")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}
