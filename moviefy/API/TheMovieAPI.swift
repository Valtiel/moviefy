//
//  TheMovieAPI.swift
//  moviefy
//
//  Created by César Rosales on 1/9/18.
//  Copyright © 2018 Alfredo Pérez Leal. All rights reserved.
//

import Foundation
import Siesta

class TheMovieAPI: Service {
    
    init() {
        super.init(baseURL: "https://api.example.com")
        
        // Global default headers
        configure {
            $0.headers["X-App-Secret"] = "2g3h4bkv234"
            $0.headers["User-Agent"] = "MyAwesomeApp 1.0"
        }
    }
}
