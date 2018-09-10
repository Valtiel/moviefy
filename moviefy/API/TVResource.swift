//
//  TVResource.swift
//  moviefy
//
//  Created by César Rosales on 2/9/18.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import Foundation
import Siesta
import SwiftyJSON

class TVResource {
    
    let resource: Resource
    
    init(_ service: TheMovieDBAPI, baseResource: Resource) {
        service.configure("/3/tv/*"){
            $0.pipeline[.model].cacheUsing(CacheManager<[TVShow]>())
        }
        service.configureTransformer("/3/tv/*") {
            try TVShow(json: $0.content as JSON)
        }
        service.configureTransformer("/3/tv/airing_today") {
            try ($0.content as JSON)["results"].arrayValue.map{try TVShow(json: $0)}
        }
        service.configureTransformer("/3/tv/on_the_air") {
            try ($0.content as JSON)["results"].arrayValue.map{try TVShow(json: $0)}
        }
        service.configureTransformer("/3/tv/popular") {
            try ($0.content as JSON)["results"].arrayValue.map{try TVShow(json: $0)}
        }
        service.configureTransformer("/3/tv/top_rated") {
            try ($0.content as JSON)["results"].arrayValue.map{try TVShow(json: $0)}
        }
        service.configureTransformer("/3/tv/similar") {
            try ($0.content as JSON)["results"].arrayValue.map{try TVShow(json: $0)}
        }
        service.configureTransformer("/3/tv/*/videos") {
            try ($0.content as JSON)["results"].arrayValue.map{try Video(json: $0)}
        }
        resource = baseResource.child("/tv")
    }
    
    func tvShow() -> Resource {
        return resource
    }
    
    func videos(id: String) -> Resource {
        return resource.child(id).child("videos")
    }
    
    func tvShow(id: Int) -> Resource {
        return resource.child(String(id))
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
    
    func airingToday() -> Resource {
        return resource.child("airing_today")
    }
    
    func onTheAir() -> Resource {
        return resource.child("on_the_air")
    }
    
    func topRated() -> Resource {
        return resource.child("top_rated")
    }
    
}
