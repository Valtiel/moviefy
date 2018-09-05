//
//  Genre.swift
//  moviefy
//
//  Created by César Rosales on 2/9/18.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import Foundation

class Genre: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

extension Genre {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Genre.self, from: data)
        self.init(id: me.id, name: me.name)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
