//
//  GithubProfileClientMock.swift
//  GithubAppTests
//
//  Created by Marcin on 26/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation
import AlamofireImage
import UIKit
@testable import GithubApp


class GithubProfileClientMock: GithubProfileService
{
    func getProfileData(for username: String, callback: @escaping (GithubProfileResponse?,String?) -> ())
    {
        guard let response = JsonLoader.getSearchUsersResponse() else {return}
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(GithubProfileResponse.self, from: response)
            callback(result,nil)
        } catch {
            callback(nil,error.localizedDescription)
            print(error.localizedDescription)
        }
    }
    
    func getUserAvatar(with url: String, callback: @escaping (Image?) -> ())
    {
        return callback(#imageLiteral(resourceName: "avatar.png"))
    }
    
    func getStars(for username: String, callback: @escaping ([GithubRepository]?, String?) -> ())
    {
        guard let response = JsonLoader.getSearchUsersResponse() else {return}
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode([GithubRepository].self, from: response)
            callback(result,nil)
        } catch {
            callback(nil,error.localizedDescription)
            print(error.localizedDescription)
        }
    }
}
