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
    lazy var presenter: NewsListPresenterProtocol = NewsListPresenter(view: self)
    
    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.fetchNewsList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewManager = NewsListTableViewManager(tableView: tableView)
    }

}

extension NewsListViewController: NewsListViewProtocol {
    func updateTable(viewModels: [Any]) {
        self.tableViewManager.configure(viewModels: viewModels)
    }
}
