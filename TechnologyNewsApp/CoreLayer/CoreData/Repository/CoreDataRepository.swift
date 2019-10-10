//
//  CoreDataRepository.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataRepository<GenericEntity: NSManagedObject & ConfigurableEntityProtocol, GenericModel: IdentityModelProtocol>: Repository {
 
    typealias Entity = GenericEntity
    typealias Model = GenericModel
    
    var context: NSManagedObjectContext
    
    init() {
        self.context = NSManagedObjectContext.mr_default()
    }
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchAll() -> [GenericEntity] {
        guard let entities = GenericEntity.mr_findAll() as? [GenericEntity] else { return [] }
        
        return entities
    }
    
    func fetchById(objectId: String?) -> GenericEntity? {
        guard let unwrappedObjectId = objectId else { return nil }
        
        guard let url = URL(string: unwrappedObjectId), let managedObjectID = self.context.persistentStoreCoordinator?.managedObjectID(forURIRepresentation: url) else {
            return nil
        }
        
        let predicate = NSPredicate(format: "self == %@", managedObjectID)
        guard let foundedEntity = GenericEntity.mr_findFirst(with: predicate, in: self.context) else {
            return nil
        }
        
        return foundedEntity
    }
    
    func create(withModel model: GenericModel) -> GenericEntity? {
        var entity: GenericEntity?
        
        guard let entityCreated = GenericEntity.mr_createEntity(in: self.context) else { return nil }
        entity = entityCreated
        
        if entity?.configureWithModel(model) != true {
            return nil
        }
    
        return entity
    }
    
    func update(withModel model: GenericModel) -> GenericEntity? {
        var entity: GenericEntity?
        
        if let entityFound = self.fetchById(objectId: model.objectId) {
            entity = entityFound
        }
        
        return entity
    }

    func deleteById(objectId: String?) -> Bool {
        guard let url = URL(string: objectId ?? ""),
            let managedObjectID = self.context.persistentStoreCoordinator?.managedObjectID(forURIRepresentation: url) else {
                
            return false
        }
        
        let predicate = NSPredicate(format: "self == %@", managedObjectID)
        if GenericEntity.mr_deleteAll(matching: predicate, in: self.context) == false {
            return false
        }
        
        return true
    }
}
