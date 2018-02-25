//
//  GithubRepository.swift
//  GithubApp
//
//  Created by Marcin on 25/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation

struct GithubRepository: Codable, GithubModel
{
    
// MARK: Publics
    
    let stargazers_count: Int
    
// MARK: Privates
    
    private let name: String
    private let id: Int
    private let modelType: GithubModelType = .repository
    
// MARK: GithubModel
    
    func getId() -> Int
    {
        return id
    }
    
    func getName() -> String
    {
        return name
    }
    
    func getModelType() -> GithubModelType
    {
        return modelType
    }
    
    func getAvatarUrl() -> String?
    {
        return nil
    }
}
