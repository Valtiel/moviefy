//
//  CacheManager.swift
//  moviefy
//
//  Created by César Rosales on 4/9/18.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import Foundation
import Siesta

class CacheManager: EntityCache {
    
    typealias Key = String

    
    func key(for resource: Resource) -> String? {
        return nil
    }
    
    func readEntity(forKey key: String) -> Entity<Any>? {
        return nil
    }
    
    func writeEntity(_ entity: Entity<Any>, forKey key: String) {
        
    }
    
    func removeEntity(forKey key: String) {
        
    }
    
    
    
    
}
