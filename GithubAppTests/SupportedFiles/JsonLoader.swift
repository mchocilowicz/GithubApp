//
//  JsonLoader.swift
//  GithubAppTests
//
//  Created by Marcin on 26/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation

class JsonLoader
{
    
    static func getSearchUsersResponse() -> Data?
    {
        if let file = Bundle(for: self).path(forResource: "SearchUsersResponse", ofType: "json") {
           return loadJson(from: file)
        }
        
            return nil
    }
    
    static func getSearchRepositoryResponse() -> Data?
    {
        if let file = Bundle(for: self).path(forResource: "SearchRepositoriesResponse", ofType: "json") {
            return loadJson(from: file)
        }
        return nil
    }
    
    static func getProfileRepositoriesResponse() -> Data?
    {
        if let file = Bundle(for: self).path(forResource: "ProfileRepositoryResponse", ofType: "json") {
            return loadJson(from: file)
        }
        return nil
    }
    
    static func getProfileUserResponse() -> Data?
    {
        if let file = Bundle(for: self).path(forResource: "ProfileUserResponse", ofType: "json") {
            return loadJson(from: file)
        }
        return nil
    }
    
    private static func loadJson(from path: String) -> Data?
    {
        guard let jsonString = try? NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) else {
            fatalError(path)
        }
        return jsonString.data(using: String.Encoding.utf8.rawValue)
    }
}
