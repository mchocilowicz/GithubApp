//
//  GithubUser.swift
//  GithubApp
//
//  Created by Marcin on 25/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation

struct GithubUser: Codable, GithubModel
{
    
// MARK: Privates
    
    private let login: String
    private let id: Int
    private let avatar_url: String
    private let modelType: GithubModelType = .user
    
// MARK: GithubModel
    
    func getId() -> Int
    {
        return id
    }
    
    func getName() -> String
    {
        return login
    }
    
    func getModelType() -> GithubModelType
    {
        return modelType
    }
    
    func getAvatarUrl() -> String?
    {
        return avatar_url
    }
}
