//
//  NewsService.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class NewsService {
   
    let baseUrl = "https://virtserver.swaggerhub.com/irish-ale/test-app/1.0.0/news"
   
    // MARK: Injections
    private let urlSessionManager = URLSessionManager()
    private let coreDataRepository = CoreDataRepository<NewsEntity, News>()
    
    // MARK: Properties
    private var urlComponents: URLComponents? {
        return URLComponents(string: baseUrl)
    }
    
    func obtainNewsList(success: @escaping(PostListResponseModel?) -> Void,
                        failure: @escaping(Error?) -> Void) {
        
        if let url = urlComponents?.url {
            urlSessionManager.resumeDataTask(url: url, success: { [unowned self] (responseObject: PostListResponseModel?) in
                if let responseObject = responseObject {
                    responseObject.posts.forEach({ [unowned self] (postResponseModel) in
                        
                        guard let url = URL(string: postResponseModel.thread.mainImageURL) else { return }
                        let imageData = try? Data(contentsOf: url)
                        
                        let news = News(title: postResponseModel.thread.title,
                                        publishedString: postResponseModel.thread.publishedDateString,
                                        author: postResponseModel.author,
                                        text: postResponseModel.text,
                                        imageData: imageData)
                        
                        let _ = self.coreDataRepository.create(withModel: news)
                    })
                    self.coreDataRepository.context.mr_saveToPersistentStore(completion: { (success, error) in
                        //
                    })
                }
            }) { (error) in
                failure(error)
            }
        }
    }
}
