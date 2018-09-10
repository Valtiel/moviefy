//
//  MovieResource.swift
//  moviefy
//
//  Created by César Rosales on 2/9/18.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import Foundation
import Siesta
import SwiftyJSON

class MovieResource {
    
    let resource: Resource

    init(_ service: TheMovieDBAPI, baseResource: Resource) {
        service.configure("/3/movie/*"){
            $0.pipeline[.model].cacheUsing(CacheManager<[Movie]>())
        }
        service.configureTransformer("/3/movie/*") {
            try Movie(json: $0.content as JSON)
        }
        service.configureTransformer("/3/movie/reviews") {
            try ($0.content as JSON)["results"].arrayValue.map{try Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/similar") {
            try ($0.content as JSON)["results"].arrayValue.map{try Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/popular") {
            try ($0.content as JSON)["results"].arrayValue.map{try Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/now_playing") {
            try ($0.content as JSON)["results"].arrayValue.map{try Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/upcoming") {
            try ($0.content as JSON)["results"].arrayValue.map{try Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/latest") {
            try ($0.content as JSON)["results"].arrayValue.map{try Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/top_rated") {
            try ($0.content as JSON)["results"].arrayValue.map{try Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/*/videos") {
            try ($0.content as JSON)["results"].arrayValue.map{try Video(json: $0)}
        }
        resource = baseResource.child("/movie")
    }
    
    func movie(id: String) -> Resource {
        return resource.child(id)
    }
    
    func videos(id: String) -> Resource {
        return resource.child(id).child("videos")
    }
    
    func reviews(id: String) -> Resource {
        return resource.child(id).child("reviews")
    }
    
    func similar(id: String) -> Resource {
        return resource.child(id).child("similar")
    }
    
    func popular() -> Resource {
        return resource.child("popular")
    }
    
    func nowPlaying() -> Resource {
        return resource.child("now_playing")
    }
    
    func upcoming() -> Resource {
        return resource.child("upcoming")
    }
    
    func latest() -> Resource {
        return resource.child("latest")
    }
    
    func top_rated() -> Resource {
        return resource.child("top_rated")
    }
    
    
}
