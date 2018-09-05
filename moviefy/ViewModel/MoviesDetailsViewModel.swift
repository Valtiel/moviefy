//
//  MoviesDetailsViewModel.swift
//  moviefy
//
//  Created by César Rosales on 04/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit
import DateToolsSwift

class MoviesDetailsViewModel: NSObject {
    let movie: Movie? = nil
    
    func detailsDataSource(for tableView: UITableView) -> Dictionary<String, [Any]> {
        var dictionary:Dictionary<String, [Any]> = .init()
        var section:Int = 0
        
        var sectionArray:[Any] = .init()
        
        sectionArray.append(DetailsTitleTableViewCell.prepareCellWith(title: (movie?.title)!, on: tableView))
        dictionary[String(section)] = sectionArray
        
        section += 1
        sectionArray = .init()
        
        sectionArray.append(DetailsDescriptionTableViewCell.prepareCellWith(description: (movie?.overview)!, on: tableView))
        dictionary[String(section)] = sectionArray
        
        section += 1
        sectionArray = .init()
        
//        sectionArray.append(DetailsTitleTableViewCell.prepareCellWith(title: "Trailers", on: tableView))
//        dictionary[String(section)] = sectionArray
//
//        section += 1
//        sectionArray = .init()
//
//        sectionArray.append(DetailsCollectionContainerTableViewCell.prepareCellWith(array: movie.tr, on: <#T##UITableView#>))
//        dictionary[String(section)] = sectionArray
        
        sectionArray.append(DetailsTitleTableViewCell.prepareCellWith(title: "Information", on: tableView))
        dictionary[String(section)] = sectionArray
        
        section += 1
        sectionArray = .init()
        
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Rating", description:"\(String(describing: movie?.popularity))", on: tableView))
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "In Theaters", description: (movie?.releaseDate.description)!, on: tableView))
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Genre", description: "", on: tableView))
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Produced by", description: (movie?.productionCompanies.first?.name)!, on: tableView))
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Run Time", description:"\(String(describing: movie?.runtime))", on: tableView))
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Website", description: (movie?.homepage)!, on: tableView))
        
        return dictionary
    }

}
