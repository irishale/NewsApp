//
//  NewsListPresenter.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class NewsListPresenter {
    
    // MARK: Properties
    var viewModels: [Any]?
    
    // MARK: Injection
    weak var view: NewsListViewProtocol!
    lazy var newsService = NewsService()
    
    init(view: NewsListViewProtocol) {
        self.view = view
    }
}

extension NewsListPresenter: NewsListPresenterProtocol {
    func fetchNewsList() {
        newsService.obtainNewsList(success: { (responseObject) in
            //
        }) { (error) in
            //
        }
    }
}
