//
//  SpotlightMovieCollectionViewCell.swift
//  moviefy
//
//  Created by César Rosales on 01/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit
import SDWebImage

class SpotlightMovieCollectionViewCell: UICollectionViewCell {
    
    var object:Any? {
        didSet{
            self.imageView!.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(self.imagePath())"), placeholderImage: UIImage(named: "placeholder.png"))
            self.titleLabel.text = self.title()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func imagePath() -> String {
        var imagePath: String = ""
        if object is Movie {
            imagePath = (object as! Movie).posterPath
        }
        if object is TVShow {
            imagePath = (object as! TVShow).backdropPath!
        }
        return imagePath
    }
    
    func title() -> String {
        var imagePath: String = ""
        if object is Movie {
            imagePath = (object as! Movie).title
        }
        if object is TVShow {
            imagePath = (object as! TVShow).name
        }
        return imagePath
    }

}
