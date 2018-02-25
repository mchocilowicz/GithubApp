//
//  ProfileViewController.swift
//  GithubApp
//
//  Created by Marcin on 24/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{
    
// MARK: Publics
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    var githubProfileService: GithubProfileService! = nil
    var profileModel: ProfileModel! = nil
    
// MARK: Memory Managment
    
    init(_ service: GithubProfileService, model: ProfileModel)
    {
        super.init(nibName: "ProfileViewController", bundle: nil)
        self.githubProfileService = service
        self.profileModel = model
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
// MARK: View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool)
    {
        githubProfileService.getProfileData(for: profileModel.username) {_,_ in
            
        }
        githubProfileService.getStars(for: profileModel.username) {_,_ in
            
        }
        githubProfileService.getUserAvatar(with: profileModel.avatar_url) { avatar in
            self.avatarImage.image = avatar
        }
    }
    
// MARK: Action Handlers
    
    @IBAction func onTouchUpInside(_ sender: Any)
    {
        self.dismiss(animated: true)
    }
    
}
