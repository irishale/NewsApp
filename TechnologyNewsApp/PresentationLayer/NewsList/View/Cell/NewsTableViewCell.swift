//
//  NewsTableViewCell.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(withViewModel viewModel: Any) {
        
    }
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

}
