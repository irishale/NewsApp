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
    
    // MARK: Properties
    private let refreshControl = UIRefreshControl()
    private var isFirstLaunch = true
    
    // MARK: Injections
    var tableViewManager: NewsListTableViewManager!
    var presenter: NewsListPresenterProtocol!
    
    // MARK: Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        
        tableViewManager = NewsListTableViewManager(tableView: tableView, router: self)
        presenter = NewsListPresenter(view: self)
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresNewsData(_:)), for: .valueChanged)
        
        if isFirstLaunch {
            presenter.fetchNewsList()
            isFirstLaunch = false
        }
    }
    
    @objc private func refresNewsData(_ sender: Any) {
        presenter.resetPageNumber()
        presenter.fetchNewsList()
        refreshControl.endRefreshing()
    }
}

extension NewsListViewController: NewsListRouterProtocol {
    func openNewsDescription(byIndex index: Int) {
        let news = presenter.fetchNews(byIndex: index)
        
        let newsDescriptionViewController = NewsDescriptionViewController.instantiate()
        newsDescriptionViewController.model = news
        
        navigationController?.pushViewController(newsDescriptionViewController, animated: true)
    }
}

extension NewsListViewController: NewsListViewProtocol {
    func activityIndicator(active: Bool) {
        if active {
            activityIndicator.startAnimating()
            tableView.isUserInteractionEnabled = false
        } else {
            activityIndicator.stopAnimating()
            tableView.isUserInteractionEnabled = true
        }
    }
    
    func addRows(viewModels: [NewsPreviewViewModel]?) {
        self.tableViewManager.addRows(viewModels: viewModels)
    }
}
