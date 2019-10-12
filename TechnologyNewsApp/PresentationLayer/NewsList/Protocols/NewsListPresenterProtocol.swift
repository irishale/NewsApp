//
//  NewsListPresenterProtocol.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

protocol NewsListPresenterProtocol: class {
    func fetchNewsList()
    
    func incrementPageNumber()
}
