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
    
    private let dispatchGroup = DispatchGroup()
    private let cellId = "Cell"
    private let searchDelay: Double = 0.7
    private var searchTimer: Timer? = nil
    
// MARK: Memory Managment
    
    init(_ service: GithubSearchService)
    {
        super.init(nibName: "SearchViewController", bundle: nil)
        self.githubSearchService = service
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit
    {
        cancelScheduledSearch()
    }
    
// MARK: - View Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
// MARK: - Action handlers
    
    @IBAction func searchTextChanged(_ sender: UITextField)
    {
        guard let text = sender.text, !text.isEmpty else { return }
        cancelScheduledSearch()
        scheduleSearch(searchString: text)
        
    }

    @objc func onSearchTimer(_ sender: Timer)
    {
        if let text = sender.userInfo as? String {
            self.requestData(text)
        }
    }
    
// MARK: - Private
    
    private func scheduleSearch(searchString: String)
    {
        self.searchTimer = Timer.scheduledTimer(timeInterval: searchDelay, target: self, selector: #selector(onSearchTimer(_:)), userInfo: searchString, repeats: false)
    }
    
    private func requestData(_ text: String)
    {
        var userModels: [GithubModel] = []
        var repositoryModels: [GithubModel] = []
        dispatchGroup.enter()
        githubSearchService.searchRepositories(with: text) {[weak self] result , error in
            guard let `self` = self  else { return }
            guard let model = result else {
                self.displayAlertOnError(error!)
                return
            }
            repositoryModels = model
            self.dispatchGroup.leave()
        }
        dispatchGroup.enter()
        githubSearchService.searchUsers(with: text) {[weak self] result, error in
            guard let `self` = self  else { return }
            guard let model = result else {
                self.displayAlertOnError(error!)
                return
            }
            userModels = model
            self.dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let `self` = self else {return}
            self.processModelsBeforeDisplay(userModels,repositoryModels)
        }
    }
    
    private func displayAlertOnError(_ message: String)
    {
        let alert = UIAlertController(title: nil, message: "Error occured. Please try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    private func processModelsBeforeDisplay(_ users: [GithubModel], _ repositories: [GithubModel])
    {
        self.tableViewModels.removeAll()
        self.tableViewModels += users
        self.tableViewModels += repositories
        self.tableViewModels.sort(by: { $0.getId() < $1.getId() })
        self.tableView.reloadData()
    }
    
    private func cancelScheduledSearch()
    {
        self.searchTimer?.invalidate()
        self.searchTimer = nil
    }
    
}

// MARK: - UITableViewDataSource UITableViewDelegate
extension SearchViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? SearchCell {
            let model = tableViewModels[indexPath.row]
            cell.assign(model.getName(), model.getModelType())
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
}

