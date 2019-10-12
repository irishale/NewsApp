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
    private var viewModels: [NewsPreviewViewModel]? = []
    
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
    
    func configure(viewModels: [NewsPreviewViewModel]) {
        self.viewModels = viewModels
        self.tableView.reloadData()
    }
    
    func addRows(viewModels: [NewsPreviewViewModel]?) {
        if self.viewModels?.count == 0 {
            self.viewModels = viewModels
            self.tableView.reloadData()
        } else {
            tableView.beginUpdates()
            
            guard let unwrappedCurrentViewModels = self.viewModels else { return }
            let row = unwrappedCurrentViewModels.count - 1
            
            guard let unwrappedUpdatedViewModels = viewModels else { return }
            
            var indexPaths = [IndexPath]()
            for (index, _) in unwrappedUpdatedViewModels.enumerated() {
                if index >= row && index < unwrappedUpdatedViewModels.count - 1 {
                    indexPaths.append(IndexPath(row: index, section: 0))
                }
            }
            
            self.viewModels = viewModels
            
            tableView.insertRows(at: indexPaths, with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension NewsListTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension NewsListTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        switch cell {
        case is NewsTableViewCell:
            let unwrappedCell = cell as! NewsTableViewCell
            if let viewModel = viewModels?[indexPath.row] {
                unwrappedCell.configure(withViewModel: viewModel)
            }
        default:
            break
        }
        
        return cell
    }
}
