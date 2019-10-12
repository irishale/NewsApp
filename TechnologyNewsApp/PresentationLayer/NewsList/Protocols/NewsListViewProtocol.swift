//
//  NewsListViewProtocol.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

protocol NewsListViewProtocol: class {
    func updateTable(viewModels: [NewsPreviewViewModel]?)
    func addRows(viewModels: [NewsPreviewViewModel]?)
    func activityIndicator(active: Bool)
    func tableVisibility(isHidden: Bool)
}
