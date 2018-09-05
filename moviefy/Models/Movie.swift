//
//  Movie.swift
//  moviefy
//
//  Created by César Rosales on 01/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit
import SwiftyUtils
import SwiftyJSON
import Foundation
import DateToolsSwift

class Movie {
    let adult: Bool
    let budget: Int
    let genres: [Any]
    let id: Int
    let homepage:String
    let originalLanguage, originalTitle, overview: String
    let popularity: Int
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let dateFormatter: DateFormatter
    let releaseDate: Date
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage, voteCount: Int
    
    init(json: JSON) {
        adult = json["adult"].boolValue
        budget = json["budget"].intValue
        genres = json["genres"].arrayValue
        id = json["id"].intValue
        homepage = json["homepage"].stringValue
        originalLanguage = json["originalLanguage"].stringValue
        originalTitle = json["originalTitle"].stringValue
        overview = json["overview"].stringValue
        popularity = json["popularity"].intValue
        posterPath = json["posterPatch"].stringValue
        productionCompanies = json["productionCompanies"].arrayValue.map {
            ProductionCompany.init(json: $0)
        }
        productionCountries = json["productionCountries"].arrayValue.map({ (json: JSON) -> ProductionCountry in
            return ProductionCountry.init(json: json)
        })
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        releaseDate = dateFormatter.date(from: json["releaseDate"].stringValue)!
        revenue = json["revenue"].intValue
        runtime = json["runtime"].intValue
        spokenLanguages = json["spokenLanguages"].arrayValue.map({ (json: JSON) -> SpokenLanguage in
            return SpokenLanguage.init(json: json)
        })
        status = json["status"].stringValue
        tagline = json["tagline"].stringValue
        title = json["title"].stringValue
        video = json["video"].boolValue
        voteAverage = json["voteAverage"].intValue
        voteCount = json["voteCount"].intValue
    }
    
}

class ProductionCompany {
    let id: Int
    let name, originCountry: String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        originCountry = json["originCountry"].stringValue
    }
}

class ProductionCountry {
    let iso3166_1, name: String
    
    init(json: JSON) {
        iso3166_1 = json["iso3166_1"].stringValue
        name = json["name"].stringValue
    }
}

class SpokenLanguage {
    let iso639_1, name: String
    
    init(json: JSON) {
        iso639_1 = json["iso_639_1"].stringValue
        name = json["name"].stringValue
    }
}
