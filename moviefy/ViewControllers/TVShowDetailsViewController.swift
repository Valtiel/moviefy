//
//  TVShowDetailsViewController.swift
//  moviefy
//
//  Created by César Rosales on 03/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit
import SDWebImage

class TVShowDetailsViewController: UIViewController {

    var tvShow: TVShow! {
        didSet {
            self.title = tvShow?.name
//            self.dateLabel.text = tvShow?.firstAirDate
            
            
            if let names = (tvShow?.genres?.compactMap(){($0 as Genre).name}) {
                var genres: String = ""
                for name in names {
                    genres.append(name)
                    if name != names.last {
                        genres.append(", ")
                    }
                }
                self.genresLabel.text = genres
            }
//            else {
//                self.genresTitleLabel.removeFromSuperview()
//                self.genresLabel.removeFromSuperview()
//            }
//            self.languageLabel.text = tvShow?.originalLanguage
//
//            self.lengthLabel.text = "\(String(describing: tvShow?.numberOfSeasons)) Seasons, \(String(describing: tvShow?.numberOfEpisodes)) Episodes"
//            self.ratingLabel.text = ""
            
           
            
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    //Title Labels
    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var genresTitleLabel: UILabel!
    @IBOutlet weak var languageTitleLabel: UILabel!
    @IBOutlet weak var lengthTitleLabel: UILabel!
    @IBOutlet weak var ratingTitleLabel: UILabel!
    @IBOutlet weak var websiteTitleLabel: UILabel!
    
    //Information Labels
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imgURL:String = "https://image.tmdb.org/t/p/original/\(tvShow.backdropPath!)" {
            self.imageView.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "placeholder.png"))
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
