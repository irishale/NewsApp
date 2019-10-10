//
//  Post.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

struct Post: Codable {
    let thread: PostThread
    let author: String
    let text: String
}

struct PostThread: Codable {
    let mainImgaeURL: String
    let title: String
    let publishedDateString: String
}
