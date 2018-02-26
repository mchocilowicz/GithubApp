//
//  GithubSearchClientMock.swift
//  GithubAppTests
//
//  Created by Marcin on 26/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation
@testable import GithubApp

class GithubSearchClientMock: GithubSearchService
{
    func searchUsers(with username: String, callback: @escaping ([GithubUser]?, String?) -> ())
    {
        
    }
    
    func searchRepositories(with name: String, callback: @escaping ([GithubRepository]?, String?) -> ())
    {
        
    }
}
