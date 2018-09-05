//
//  TVShowsDetailsViewModel.swift
//  moviefy
//
//  Created by César Rosales on 04/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class TVShowsDetailsViewModel: NSObject {
    var tvShow: TVShow!
    
    init(tvs: TVShow) {
        super.init()
        tvShow = tvs;
    }
    
    func detailsDataSource(for tableView: UITableView) -> Dictionary<String, [Any]> {
        var dictionary:Dictionary<String, [Any]> = .init()
        var section:Int = 1
        
        var sectionArray:[Any] = .init()
        
        sectionArray.append(DetailsTitleTableViewCell.prepareCellWith(title: (tvShow?.name)!, on: tableView))
        sectionArray.append(DetailsDescriptionTableViewCell.prepareCellWith(description: (tvShow?.overview)!, on: tableView))
        dictionary[String(section)] = sectionArray
        
        section += 1
        sectionArray = .init()
        
        if let tvShow = tvShow  {
            sectionArray.append(DetailsTitleTableViewCell.prepareCellWith(title: "Information", on: tableView))
            if let popularity = tvShow.popularity {
                sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Rating", description:"\(popularity)", on: tableView))
            }
  
            sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "In Theaters", description: tvShow.firstAirDate!, on: tableView))
            sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Genre", description: "", on: tableView))
//            sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Produced by", description: (tvShow.productionCompanies?.first?.name)!, on: tableView))
            sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Run Time", description:"", on: tableView))
//            sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Website", description: tvShow.homepage!, on: tableView))
        }
        
        dictionary[String(section)] = sectionArray
        
        return dictionary
    }
    
    func imageURL() -> URL {
        print("https://image.tmdb.org/t/p/original\(tvShow!.backdropPath!)")
        return URL.init(string: "https://image.tmdb.org/t/p/original\(tvShow!.backdropPath!)")!
    }

}
