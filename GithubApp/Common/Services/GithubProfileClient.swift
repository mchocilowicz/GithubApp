//
//  GithubProfileClient.swift
//  GithubApp
//
//  Created by Marcin on 25/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation
import Alamofire

protocol GithubProfileService
{
    func getProfileData(for username: String, callback: String)
    func getUserAvatar(with url: String, callback: String)
}

class GithubProfileClient: GithubProfileService
{
    func getProfileData(for username: String, callback: String)
    {
        
    }
    
    func getUserAvatar(with url: String, callback: String)
    {
        
    }
    
    
}

