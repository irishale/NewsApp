//
//  PostResponseModel.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

struct PostResponseModel: Codable {    
    var thread: PostThreadResponseModel
    var author: String
    var text: String
}

struct PostThreadResponseModel: Codable {
    let mainImageURL: String
    var title: String
    let publishedDateString: String
    
    enum CodingKeys: String, CodingKey {
        case mainImageURL = "main_image"
        case title
        case publishedDateString = "published"
    }
}
