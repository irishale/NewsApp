//
//  NewsRepository.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import Reachability

protocol NewsRepositoryProtocol {
    func fetchAll() -> [News]

    func fetchByPage(page: Int) -> [News]
    
    func fetchById(objectId: String?) -> News?
}

class NewsRepository: NewsRepositoryProtocol {
    let coreDataRepository: CoreDataRepository<NewsEntity, News>
    
    init () {
        coreDataRepository = CoreDataRepository<NewsEntity, News>()
    }
    
    func fetchAll() -> [News] {
        return coreDataRepository.fetchAll().map({ (newsEntity) -> News in
            return News(withEntity: newsEntity)
        })
    }
    
    func fetchByPage(page: Int) -> [News] {
        return coreDataRepository.fetchByPage(page: page).map({ (newsEntity) -> News in
            return News(withEntity: newsEntity)
        })
    }
    
    func fetchById(objectId: String?) -> News? {
        guard let unwrappedObjectId = objectId else { return nil }
        
        guard let news = coreDataRepository.fetchById(objectId: unwrappedObjectId) else { return nil }
        return News(withEntity: news)
    }
}
