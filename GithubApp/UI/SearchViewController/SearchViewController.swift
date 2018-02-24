//
//  SearchViewController.swift
//  GithubApp
//
//  Created by Marcin on 24/02/2018.
//  Copyright © 2018 Marcin. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController
{

// MARK: Publics
    
    @IBOutlet weak var tableView: UITableView!
    
    var githubSearchService: GithubSearchService! = nil
    var tableViewModels: [GithubModel] = []
    
// MARK: Privates
    
    private var userModels: [GithubUser] = []
    private var repositoryModels: [GithubRepository] = []
    private let dispatchGroup = DispatchGroup()
    
// MARK: View Lifecycle
    
    override func awakeFromNib() {
        githubSearchService = GithubSearchClient()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
// MARK: Action handlers
    
    @IBAction func searchTextChanged(_ sender: UITextField)
    {
        guard let text = sender.text, !text.isEmpty else { return }
        dispatchGroup.enter()
        githubSearchService.searchRepositories(with: text) { result , error in
            self.repositoryModels = result!
            self.dispatchGroup.leave()
        }
        dispatchGroup.enter()
        githubSearchService.searchUsers(with: text) { result, error in
            self.userModels = result!
            self.dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            
        }
        
        
    }
    
}

// MARK: - UITableViewDataSource UITableViewDelegate
extension SearchViewController: UITableViewDataSource, UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
}

