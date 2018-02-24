//
//  GithubClient.swift
//  GithubApp
//
//  Created by Marcin on 24/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation
import Alamofire

protocol GithubSearchService
{
    func searchUsers(with username: String, callback: (String?, String?) -> ())
    func searchRepositories(with name: String, callback: (String?, String?) -> ())
}

class GithubSearchClient: GithubSearchService
{
    func searchUsers(with username: String, callback: (String?, String?) -> ())
    {
        let params: [String: Any] = [
            "q": username
        ]
        Alamofire.request("https://api.github.com/search/users",parameters: params).responseData { response in
            
        }
    }
    
    func searchRepositories(with name: String, callback: (String?, String?) -> ())
    {
        let params: [String: Any] = [
            "q": name
        ]
        Alamofire.request("https://api.github.com/search/repositories",parameters: params).responseData { response in
            
        }
    }
}
