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
