//
//  CoreDataManager.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import CoreData
import MagicalRecord

final class CoreDataManager {
    
    var context: NSManagedObjectContext
    
    init() {
        self.context = NSManagedObjectContext.mr_default()
    }
}

protocol CoreDataManagerProtocol {
    func obtainById() -> NSManagedObject?
    
    func obtain(withFilter: Any?) -> [NSManagedObject]
    
    func create(withModel: Any) -> NSManagedObject?
    
    func update(withModel: Any) -> NSManagedObject?
    
    // TODO: мб стоит удалять по модели?
    func delete(byId: Int) -> Bool
}
