//
//  GithubProfileClient.swift
//  GithubApp
//
//  Created by Marcin on 25/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

protocol GithubProfileService
{
    func getProfileData(for username: String, callback: @escaping (GithubProfileResponse?,String?) -> ())
    func getUserAvatar(with url: String, callback: @escaping (Image?) -> ())
    func getStars(for username: String, callback: @escaping ([GithubRepository]?, String?) -> ())
}

class GithubProfileClient: GithubProfileService
{
    func getProfileData(for username: String, callback: @escaping (GithubProfileResponse?,String?) -> ()) {
        Alamofire.request("https://api.github.com/users/\(username)").responseData { response in
            let decoder = JSONDecoder()
            guard let data = response.data else { return }
            do {
                let result = try decoder.decode(GithubProfileResponse.self, from: data)
                callback(result,nil)
            } catch {
                callback(nil,error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserAvatar(with url: String, callback: @escaping (Image?) -> ()) {
        Alamofire.request(url).responseImage { response in
            if let image = response.result.value {
                callback(image)
            } else {
                callback(nil)
            }
        }
    }
    
    func getStars(for username: String, callback: @escaping ([GithubRepository]?, String?) -> ()) {
        Alamofire.request("https://api.github.com/users/\(username)/repos").responseData { response in
            let decoder = JSONDecoder()
            guard let data = response.data else { return }
            do {
                let result = try decoder.decode([GithubRepository].self, from: data)
                callback(result,nil)
            } catch {
                callback(nil,error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    

}

