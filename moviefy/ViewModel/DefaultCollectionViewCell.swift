//
//  DefaultCollectionViewCell.swift
//  moviefy
//
//  Created by César Rosales on 05/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class DefaultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var item:Any? {
        didSet{
            self.prepareCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell() {
        if item is Movie {
            let viewModel: MoviesDetailsViewModel = MoviesDetailsViewModel(movie: (item as! Movie))
            imageView.sd_setImage(with: viewModel.posterImageURL())
            label.text = viewModel.name()
        }
        if item is TVShow {
            let viewModel: TVShowsDetailsViewModel = TVShowsDetailsViewModel(tvShow: (item as! TVShow))
            imageView.sd_setImage(with: viewModel.posterImageURL())
            label.text = viewModel.name()
        }
    }
}
