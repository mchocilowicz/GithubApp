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
        usernameLabel.text = profileModel.username
    }

    override func viewWillAppear(_ animated: Bool)
    {
        githubProfileService.getProfileData(for: profileModel.username) {[weak self] result , error in
            guard let model = result, let `self` = self else {return}
            self.followersLabel.text = "\(model.followers)"
        }
        githubProfileService.getStars(for: profileModel.username) { [weak self] models , error in
            guard let list = models, let `self` = self else {return}
            var stars: Int = 0
            list.forEach{ stars += $0.stargazers_count}
            self.starsLabel.text = "\(stars)"
        }
        githubProfileService.getUserAvatar(with: profileModel.avatar_url) {[weak self] avatar in
            guard let `self` = self else { return }
            self.avatarImage.image = avatar
        }
    }
    
// MARK: Action Handlers
    
    @IBAction func onTouchUpInside(_ sender: Any)
    {
        self.dismiss(animated: true)
    }
    
}
