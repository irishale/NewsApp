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
    lazy var tableViewManager = NewsListTableViewManager(tableView: tableView)
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension NewsListViewController: NewsListViewProtocol {
    
}
