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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    // MARK: Injections
    var tableViewManager: NewsListTableViewManager!
    var presenter: NewsListPresenterProtocol!
    
    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        tableViewManager = NewsListTableViewManager(tableView: tableView)
        presenter = NewsListPresenter(view: self)
        
        presenter.fetchNewsList()
        
        tableView.addInfiniteScroll { [unowned self] (tableView) -> Void in
            // update table view
            self.presenter.incrementPageNumber()
            self.presenter.fetchNewsList()
            
            // finish infinite scroll animation
            tableView.finishInfiniteScroll()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NewsListViewController: NewsListViewProtocol {
    func activityIndicator(active: Bool) {
        if active {
            activityIndicator.startAnimating()
            loadingLabel.isHidden = false
        } else {
            activityIndicator.stopAnimating()
            loadingLabel.isHidden = true
        }
    }
    
    func tableVisibility(isHidden: Bool) {
        tableView.isHidden = isHidden
    }
    
    func addRows(viewModels: [NewsPreviewViewModel]?) {
        self.tableViewManager.addRows(viewModels: viewModels)
    }
    
    func updateTable(viewModels: [NewsPreviewViewModel]?) {
//        guard let unwrappedViewModel = viewModels else {
//            self.tableViewManager.configure(viewModels: [])
//            return
//        }
//        self.tableViewManager.configure(viewModels: unwrappedViewModel)
    }
}
