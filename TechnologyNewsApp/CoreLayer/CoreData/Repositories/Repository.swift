//
//  Repository.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
// TODO: убрать, покрыть context интерфейсом, если понадобится
import CoreData


protocol Repository {
    // MARK: Properties
    var context: NSManagedObjectContext { get }
    
    // MARK: Inits
    init(context: NSManagedObjectContext)
    
    // MARK: Methods
    func fetchAll() -> [Any]
    
    func fetchById() -> Any
    
    func create(withModel: Any) -> Any
    
    func update(withModel: Any) -> Any
    
    func deleteById() -> Bool
    
    func removeAll() -> Bool
}
