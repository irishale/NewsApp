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
    var viewModels: [NewsPreviewViewModel]?
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
    func fetchNewsList() {
        if Reachability.isNetworkReachable() {
            newsService.obtainNewsList(completion: { [unowned self] in
                self.viewModels = self.newsRepository.fetchByPage(page: self.page).map({ (news) -> NewsPreviewViewModel in
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
            }) { (error) in
                print(error)
            }
        } else {
            self.viewModels = self.newsRepository.fetchByPage(page: page).map({ (news) -> NewsPreviewViewModel in
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
        }
    }
}
