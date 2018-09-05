//
//  DefaultMovieCollectionViewCell.swift
//  moviefy
//
//  Created by César Rosales on 01/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class DefaultMovieCollectionViewCell: UICollectionViewCell {
    
//    var movie:Movie = Movie.init()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
