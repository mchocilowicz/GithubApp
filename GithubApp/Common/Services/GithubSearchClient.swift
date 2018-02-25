//
//  GithubSearchClient.swift
//  GithubApp
//
//  Created by Marcin on 24/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation
import Alamofire

protocol GithubSearchService
{
    func searchUsers(with username: String, callback: @escaping ([GithubUser]?, String?) -> ())
    func searchRepositories(with name: String, callback: @escaping ([GithubRepository]?, String?) -> ())
}

class GithubSearchClient: GithubSearchService
{
    
// MARK: GithubSearchService
    
    func searchUsers(with username: String, callback: @escaping ([GithubUser]?, String?) -> ())
    {
        Alamofire.request("https://api.github.com/search/users",parameters: createParams(username), headers: createRequestHeader()).responseData { response in
            let decoder = JSONDecoder()
            guard let data = response.data else { return }
            do {
                let result = try decoder.decode(GithubUsersReponse.self, from: data)
                callback(result.items,nil)
            } catch {
                callback(nil,error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    func searchRepositories(with name: String, callback: @escaping ([GithubRepository]?, String?) -> ())
    {
        Alamofire.request("https://api.github.com/search/repositories",parameters: createParams(name), headers: createRequestHeader()).responseData { response in
            let decoder = JSONDecoder()
            guard let data = response.data else { return }
            do {
                let result = try decoder.decode(GithubRepositoryResponse.self, from: data)
                callback(result.items,nil)
            } catch {
                callback(nil,error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
// MARK: Private
    
    private func createParams(_ query: String) -> Parameters
    {
        return ["q": query]
    }
    
    private func createRequestHeader() -> [String: String]
    {
        return ["Accept":"application/vnd.github.v3+json"]
    }
}
