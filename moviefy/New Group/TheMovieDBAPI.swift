//
//  TheMovieDBAPI.swift
//  moviefy
//
//  Created by César Rosales on 1/9/18.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import Foundation
import Siesta
import SwiftyJSON

let theMovieDBAPI = TheMovieDBAPI()

fileprivate let environment = Environment()

struct Environment {
    let apiKey =   Bundle.main.infoDictionary!  ["api_key"] as! String
    let baseURL =  Bundle.main.infoDictionary!  ["base_url"] as! String
}

class TheMovieDBAPI: Service {
    
    var base: Resource { return resource("3").withParam("api_key", environment.apiKey) }
    var tvResource: TVResource?
    var movieResources: MovieResource?

    init() {
        super.init(baseURL: environment.baseURL)
        self.tvResource = TVResource(self, baseResource: base)
        self.movieResources = MovieResource(self, baseResource: base)
        configureServices()
        invalidateConfiguration()
    }
    
    fileprivate func configureServices(){
        #if DEBUG
//        Siesta.siesta = SiestaLog.Category.detailed
        #endif
        self.configure("**") {
            $0.pipeline[.parsing].add(SwiftyJSONTransformer, contentTypes: ["*/json"])
        }
    }
    
}

private let SwiftyJSONTransformer =
    ResponseContentTransformer
        { JSON($0.content as AnyObject) }
