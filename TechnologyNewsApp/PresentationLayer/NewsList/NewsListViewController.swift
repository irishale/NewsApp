//
//  NewsListViewController.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Injections
    var tableViewManager: NewsListTableViewManager!
    var presenter: NewsListPresenterProtocol!
    
    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableViewManager = NewsListTableViewManager(tableView: tableView)
        presenter = NewsListPresenter(view: self)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func click(_ sender: Any) {
        presenter.fetchNewsList()
    }
}

extension NewsListViewController: NewsListViewProtocol {
    func updateTable(viewModels: [Any]) {
        self.tableViewManager.configure(viewModels: viewModels)
    }
}
