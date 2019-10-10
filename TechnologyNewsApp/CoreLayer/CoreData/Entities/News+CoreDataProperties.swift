//
//  News+CoreDataProperties.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: NSData?
    @NSManaged public var image: NSData?
    @NSManaged public var author: String?
    @NSManaged public var publishedDate: NSDate?

}
