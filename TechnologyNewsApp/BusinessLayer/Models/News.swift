//
//  News.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 11/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class News: IdentityModelProtocol {
    var objectId: String?
    
    var title: String
    var published: Date?
    var author: String
    var text: String
    var imageData: Data?
    
    init(title: String,
         publishedString: String,
         author: String,
         text: String,
         imageData: Data?) {
        
        self.title = title
        self.author = author
        self.text = text
        self.imageData = imageData
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let posix = Locale(identifier: "ru_RU_POSIX")
        dateFormatter.locale = posix
        
        self.published = dateFormatter.date(from: publishedString)
    }
    
    init(withEntity entity: NewsEntity) {
        objectId = entity.objectID.uriRepresentation().absoluteString
        title = entity.title ?? ""
        published  = entity.publishedDate as Date?
        author = entity.author ?? ""
        text = entity.content ?? ""
        imageData = entity.image as Data?
    }
}
