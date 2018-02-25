//
//  GithubUsersReponse.swift
//  GithubApp
//
//  Created by Marcin on 25/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation

struct GithubUsersReponse: Codable
{
    let total_count: Int
    let incomplete_results: Bool
    let items: [GithubUser]
}
