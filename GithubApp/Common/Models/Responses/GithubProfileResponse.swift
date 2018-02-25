//
//  GithubProfileResponse.swift
//  GithubApp
//
//  Created by Marcin on 25/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation

struct GithubProfileResponse: Codable
{
    let login: String
    let followers: Int
}
