//
//  NewsEntity+CoreDataClass.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//
//

import Foundation
import CoreData

@objc(NewsEntity)
public class NewsEntity: NSManagedObject, ConfigurableEntityProtocol {
    func configureWithModel(_ model: IdentityModelProtocol) -> Bool {
    
        guard let modelUnwrap = model as? News else { return false }
        self.author = modelUnwrap.author
        self.content = modelUnwrap.text
        self.publishedDate = modelUnwrap.published as NSDate?
        self.title = modelUnwrap.title

        return true
    }
}
