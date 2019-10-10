//
//  NewsListTableViewManager.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewManager: NSObject {
    
    // MARK: Constants
    let identifier = "NewsTableViewCell"
    
    // MARK: Properties
    var tableView: UITableView!
    private var viewModels: [Any]?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
        super.init()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        
        self.tableView.addInfiniteScroll { (tableView) in
            tableView.finishInfiniteScroll()
        }
    }
    
    func configure(viewModels: [Any]) {
        self.viewModels = viewModels
        self.tableView.reloadData()
    }
    
}

extension NewsListTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch cell {
        case is NewsTableViewCell:
            let unwrappedCell = cell as! NewsTableViewCell
            if let viewModel = viewModels?[indexPath.row] {
                unwrappedCell.configure(withViewModel: viewModel)
            }
        default:
            return
        }
    }
}

extension NewsListTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
