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
        service.configureTransformer("/3/movie/*") {
            Movie(json: $0.content as JSON)
        }
        service.configureTransformer("/3/movie/reviews") {
            ($0.content as JSON)["results"].arrayValue.map{Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/similar") {
            ($0.content as JSON)["results"].arrayValue.map{Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/popular") {
            ($0.content as JSON)["results"].arrayValue.map{Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/now_playing") {
            ($0.content as JSON)["results"].arrayValue.map{Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/upcoming") {
            ($0.content as JSON)["results"].arrayValue.map{Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/latest") {
            ($0.content as JSON)["results"].arrayValue.map{Movie(json: $0)}
        }
        service.configureTransformer("/3/movie/top_rated") {
            ($0.content as JSON)["results"].arrayValue.map{Movie(json: $0)}
        }
        resource = baseResource.child("/movie")
    }
    
    func movie(id: String) -> Resource {
        return resource.child(id)
    }
    
    func reviews(id: String) -> Resource {
        return resource.child(id).child("reviews")
    }
    
    func similar(id: String) -> Resource {
        return resource.child(id).child("similar")
    }
    
    func popular(id: String) -> Resource {
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
