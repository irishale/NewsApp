//
//  NewsDescriptionPresenter.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 13/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

class NewsDescriptionPresenter {
    
    // MARK: Properties
    var viewModel: NewsDescriptionViewModel?
    
    // MARK: Injections
    var view: NewsDescriptionViewProtocol
    
    init(view: NewsDescriptionViewProtocol) {
        self.view = view
    }
}

extension NewsDescriptionPresenter: NewsDescriptionPresenterProtocol {
    func configure(withModel model: News) {
        viewModel = NewsDescriptionViewModel(imageData: nil, title: model.title, text: model.text)
        viewModel?.imageData = model.imageData
        view.update(withViewModel: viewModel)
    }
}
