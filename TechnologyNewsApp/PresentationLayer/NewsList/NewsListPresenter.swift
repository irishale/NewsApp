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
    var viewModels: [NewsPreviewViewModel]? = []
    var page = 0
    
    // MARK: Injection
    var view: NewsListViewProtocol!
    var newsService: NewsServiceProtocol
    var newsRepository: NewsRepositoryProtocol
    
    init(view: NewsListViewProtocol) {
        self.view = view
        self.newsService = NewsService()
        self.newsRepository = NewsRepository()
    }
}

extension NewsListPresenter: NewsListPresenterProtocol {
    func incrementPageNumber() {
        self.page += 1
    }
    
    func fetchNewsList() {
        self.view.activityIndicator(active: true)
        self.view.tableVisibility(isHidden: true)
        if Reachability.isNetworkReachable() {
            newsService.obtainNewsList(completion: { [unowned self] in
                let viewModels = self.newsRepository.fetchByPage(page: self.page).map({ (news) -> NewsPreviewViewModel in
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "d MMMM yyyy"
                    
                    var dateString = ""
                    if let unwrappedDate = news.published {
                        dateString = dateFormatter.string(from: unwrappedDate)
                    }
                    
                    return NewsPreviewViewModel(title: news.title,
                                                date: dateString,
                                                author: news.author)
                })
                self.viewModels?.append(contentsOf: viewModels)
                self.view.addRows(viewModels: self.viewModels)
                self.view.activityIndicator(active: false)
                self.view.tableVisibility(isHidden: false)
            }) { (error) in
                print(error)
                self.view.activityIndicator(active: false)
                self.view.tableVisibility(isHidden: true)
            }
        } else {
            let viewModels = self.newsRepository.fetchByPage(page: page).map({ (news) -> NewsPreviewViewModel in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "d.MM.yyyy"

                var dateString = ""
                if let unwrappedDate = news.published {
                    dateString = dateFormatter.string(from: unwrappedDate)
                }
                
                return NewsPreviewViewModel(title: news.title,
                                            date: dateString,
                                            author: news.author)
            })
            self.viewModels?.append(contentsOf: viewModels)
            self.view.addRows(viewModels: self.viewModels)
            self.view.activityIndicator(active: false)
            self.view.tableVisibility(isHidden: false)
        }
    }
}
