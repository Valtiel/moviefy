//
//  TVShowsDetailsViewModel.swift
//  moviefy
//
//  Created by César Rosales on 04/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class TVShowsDetailsViewModel {
    
    let tvShow: TVShow
    
    init(tvShow: TVShow) {
        self.tvShow = tvShow
    }
    
    func detailsDataSource(for tableView: UITableView) -> Dictionary<String, [Any]> {
        var dictionary:Dictionary<String, [Any]> = .init()
        var section:Int = 0
        
        var sectionArray:[Any] = .init()
        
        sectionArray.append(DetailsTitleTableViewCell.prepareCellWith(title: (tvShow.name), on: tableView))
        sectionArray.append(DetailsDescriptionTableViewCell.prepareCellWith(description: (tvShow.overview)!, on: tableView))
        dictionary[String(section)] = sectionArray
        
        section += 1
        sectionArray = .init()
        
        sectionArray.append(DetailsTitleTableViewCell.prepareCellWith(title: "Information", on: tableView))
        if let popularity = tvShow.popularity {
            sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Rating", description:"\(popularity)", on: tableView))
        }
        
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "In Theaters", description: tvShow.firstAirDate!, on: tableView))
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Genre", description: "", on: tableView))
        //            sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Produced by", description: (tvShow.productionCompanies?.first?.name)!, on: tableView))
        sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Run Time", description:"", on: tableView))
        //            sectionArray.append(DetailsTitleDescTableViewCell.prepareCellWith(title: "Website", description: tvShow.homepage!, on: tableView))
        
        
        dictionary[String(section)] = sectionArray
        
        return dictionary
    }
    
    func posterImageURL() -> URL? {
        guard let url = URL(string: "https://image.tmdb.org/t/p/original\(tvShow.posterPath!)")  else {
            return nil
        }
        return url
    }
    
    func backdropImageURL() -> URL? {
        guard let backdropPath = tvShow.backdropPath else {
            return nil
        }
        return URL(string: "\(baseImageURL)t/p/original\(backdropPath)")!
    }
    
    func name() -> String {
        return tvShow.name
    }
    
}
