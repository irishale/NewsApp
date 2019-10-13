//
//  NewsDescriptionViewController.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 13/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

class NewsDescriptionViewController: UIViewController {
    
    static func instantiate() -> NewsDescriptionViewController {
        let instance = UIStoryboard(name: "NewsDescription", bundle: nil).instantiateViewController(withIdentifier: "NewsDescriptionViewController") as! NewsDescriptionViewController
        instance.presenter = NewsDescriptionPresenter(view: instance)
        
        return instance
    }
    
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var newsDescriptionTextView: UITextView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    // MARK: Properties
    var model: News?
    
    // MARK: Injections
    var presenter: NewsDescriptionPresenterProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let unwrappedModel = model {
            presenter?.configure(withModel: unwrappedModel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension NewsDescriptionViewController: NewsDescriptionViewProtocol {
    func update(withViewModel viewModel: NewsDescriptionViewModel?) {
        guard let viewModel = viewModel else { return }
        
        if let imageData = viewModel.imageData,
            let image = UIImage(data: imageData) {
            imageView.image = image
            imageViewHeightConstraint.constant = 200
        } else {
            imageViewHeightConstraint.constant = 0
        }
        
        newsTitleLabel.text = viewModel.title
        newsDescriptionTextView.text = viewModel.text
    }
}
