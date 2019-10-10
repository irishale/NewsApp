//
//  Repository.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation

protocol IdentityModelProtocol {
    var objectId: String? { get set }
}

protocol ConfigurableEntityProtocol: class {
    func configureWithModel(_ model: IdentityModelProtocol) -> Bool
}

protocol Repository {
    associatedtype Entity: ConfigurableEntityProtocol
    associatedtype Model: IdentityModelProtocol
    
    func fetchAll() -> [Entity]
    
    func fetchById(objectId: String?) -> Entity?
    
    func create(withModel model: Model) -> Entity?
    
    func update(withModel model: Model) -> Entity?
    
    func deleteById(objectId: String?) -> Bool
}
