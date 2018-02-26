//
//  ProfileViewControllerTests.swift
//  GithubAppTests
//
//  Created by Marcin on 26/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import XCTest
@testable import GithubApp

class ProfileViewControllerTests: XCTestCase
{
    var profileViewController: ProfileViewController! = nil
    let profileModel = ProfileModel(username: "Test", avatar_url: "testing")
    
    override func setUp()
    {
        super.setUp()
        profileViewController = ProfileViewController(GithubProfileClientMock(), model: profileModel)
        _ = profileViewController.view
    }
    
    func testUsernameLabelExists()
    {
        XCTAssertNotNil(profileViewController.usernameLabel)
    }
    
    func testAvatarImageViewExists()
    {
        XCTAssertNotNil(profileViewController.avatarImage)
    }
    
    func testFollowersLabelExists()
    {
        XCTAssertNotNil(profileViewController.followersLabel)
    }
    
    func testStarsLabelExists()
    {
        XCTAssertNotNil(profileViewController.starsLabel)
    }
    
    func testUsernameIsSet()
    {
        XCTAssertEqual(profileViewController.usernameLabel.text, profileModel.username)
    }
    
    func testSetStarsFromService()
    {
        profileViewController.viewWillAppear(true)
        XCTAssertEqual(profileViewController.starsLabel.text, "30615")
    }
    
    func testSetFollowersFromService()
    {
        profileViewController.viewWillAppear(true)
        XCTAssertEqual(profileViewController.followersLabel.text, "715")
    }
    
    func testSetAvatarFromService()
    {
        profileViewController.viewWillAppear(true)
        XCTAssertNotNil(profileViewController.avatarImage.image)
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
