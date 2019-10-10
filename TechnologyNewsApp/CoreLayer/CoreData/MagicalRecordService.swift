//
//  CoreDataStack.swift
//  TechnologyNewsApp
//
//  Created by IrishAle on 10/10/2019.
//  Copyright © 2019 IrishAle. All rights reserved.
//

import Foundation
import CoreData
import MagicalRecord

final class MagicalRecordService {
    
    private let coreDataModelName = "TechnologyNewsApp"
    
    static var shared = MagicalRecordService()
    
    private init () {}
    
    func setupCoreDataStack() {
        MagicalRecord.setupCoreDataStack(withStoreNamed: self.coreDataModelName)
    }
    
    func cleanUp() {
        MagicalRecord.cleanUp()
    }
}
