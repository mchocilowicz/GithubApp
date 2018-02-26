//
//  SearchViewControllerTests.swift
//  GithubAppTests
//
//  Created by Marcin on 26/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import XCTest
@testable import GithubApp

class SearchViewControllerTests: XCTestCase
{
    
    var searchViewController: SearchViewController! = nil
    
    override func setUp()
    {
        super.setUp()
        searchViewController = SearchViewController(GithubSearchClientMock())
        _ = searchViewController.view
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testHaveTableView()
    {
        XCTAssertNotNil(searchViewController.tableView)
    }
    
    func testTableViewModelsIsEmpty()
    {
        XCTAssertTrue(searchViewController.tableViewModels.isEmpty)
    }
    
    func testServiceIsAvilable()
    {
        XCTAssertNotNil(searchViewController.githubSearchService)
    }
    
    func testHandlerForTextChangeExists()
    {
        XCTAssertNotNil(searchViewController.searchTextChanged)
    }
    
    func testReceiveDataAfterDelay()
    {
        let sender = UITextField()
        sender.text = "M"
        let timer = Timer.scheduledTimer(timeInterval: 1, target: searchViewController , selector: #selector(searchViewController.onSearchTimer(_:)), userInfo: "M", repeats: false)
        searchViewController.searchTextChanged(sender)
        searchViewController.onSearchTimer(timer)
        waitForResponse()
        XCTAssertFalse(searchViewController.tableViewModels.isEmpty)
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
