//
//  NewsEntity+CoreDataProperties.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//
//

import Foundation
import CoreData


extension NewsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsEntity> {
        return NSFetchRequest<NewsEntity>(entityName: "NewsEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var image: NSData?
    @NSManaged public var author: String?
    @NSManaged public var publishedDate: NSDate?

}
