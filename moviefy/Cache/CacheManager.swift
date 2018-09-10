//
//  CacheManager.swift
//  moviefy
//
//  Created by César Rosales on 4/9/18.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import Foundation
import Siesta
import Cache

class CacheManager<T: Codable>: EntityCache {
    
    typealias Key = String
    
    let diskConfig = DiskConfig(name: "TMDBDisk")
    let memoryConfig = MemoryConfig(expiry: .never, countLimit: 10, totalCostLimit: 10)
    let storage: Storage<T>

    init(){
        storage = try! Storage(
        diskConfig: diskConfig,
        memoryConfig: memoryConfig,
        transformer: TransformerFactory.forCodable(ofType: T.self)
        )
    }
    
    func key(for resource: Resource) -> String? {
        return resource.url.absoluteString
    }
    
    func readEntity(forKey key: String) -> Entity<Any>? {
        do {
                return Entity<Any>(content: try storage.object(forKey: key), contentType: "Model")
        } catch {
            return nil
        }
    }
    
    func writeEntity(_ entity: Entity<Any>, forKey key: String) {
        if let object: T = entity.typedContent() {
            try! storage.setObject(object, forKey: key)
            return
        }
    }
    
    func removeEntity(forKey key: String) {
        try! storage.removeObject(forKey: key)
    }
    
}
