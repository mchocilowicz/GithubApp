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
    var profileModel: String! = nil
    
// MARK: Memory Managment
    
    init(_ service: GithubProfileService, username: String)
    {
        super.init(nibName: "ProfileViewController", bundle: nil)
        self.githubProfileService = service
        self.profileModel = username
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

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
