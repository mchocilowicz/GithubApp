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
        guard let response = JsonLoader.getSearchUsersResponse() else {return}
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(GithubUsersReponse.self, from: response)
            callback(result.items,nil)
        } catch {
            callback(nil,error.localizedDescription)
            print(error.localizedDescription)
        }
    }
    
    func searchRepositories(with name: String, callback: @escaping ([GithubRepository]?, String?) -> ())
    {
        guard let response = JsonLoader.getSearchRepositoryResponse() else {return}
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(GithubRepositoryResponse.self, from: response)
            callback(result.items,nil)
        } catch {
            callback(nil,error.localizedDescription)
            print(error.localizedDescription)
        }
    }
}
