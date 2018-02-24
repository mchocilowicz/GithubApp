//
//  GithubModelType.swift
//  GithubApp
//
//  Created by Marcin on 24/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation

enum GithubModelType: String, Codable
{
    case user
    case repository
    
    func toString() -> String
    {
        switch self {
        case .user: return "USER"
        case .repository: return "REPOSITORY"
        }
    }
}
