//
//  SearchCell.swift
//  GithubApp
//
//  Created by Marcin on 24/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell
{
    
// MARK: Publics
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelTypeLabel: UILabel!

// MARK: Public
    
    func assign(_ name: String, _ type: GithubModelType)
    {
        nameLabel.text = name
        modelTypeLabel.text = type.toString()
    }
}
