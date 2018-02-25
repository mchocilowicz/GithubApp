//
//  GithubModel.swift
//  GithubApp
//
//  Created by Marcin on 24/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation

protocol GithubModel
{
    func getId() -> Int
    func getName() -> String
    func getModelType() -> GithubModelType
    func getAvatarUrl() -> String?
}


struct GithubUsersReponse: Codable
{
    let total_count: Int
    let incomplete_results: Bool
    let items: [GithubUser]
}

struct GithubRepositoryResponse: Codable
{
    let total_count: Int
    let incomplete_results: Bool
    let items: [GithubRepository]
}

struct GithubUser: Codable, GithubModel
{
    
    private let login: String
    private let id: Int
    private let avatar_url: String
    private let modelType: GithubModelType = .user
    
    func getId() -> Int {
        return id
    }
    
    func getName() -> String {
        return login
    }
    
    func getModelType() -> GithubModelType {
        return modelType
    }
    
    func getAvatarUrl() -> String? {
        return avatar_url
    }
}

struct GithubRepository: Codable, GithubModel
{
    
    private let name: String
    private let id: Int
    private let stargazers_count: Int
    private let modelType: GithubModelType = .repository
    
    func getId() -> Int {
        return id
    }
    
    func getName() -> String {
        return name
    }
    
    func getModelType() -> GithubModelType {
        return modelType
    }
    
    func getAvatarUrl() -> String? {
        return nil
    }
}
