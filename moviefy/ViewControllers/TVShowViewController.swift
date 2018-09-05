//
//  TVShowViewController.swift
//  moviefy
//
//  Created by César Rosales on 2/9/18.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit
import Siesta

class TVShowViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var tvShowResource: Resource? {
        didSet {
            updateObservation(from: oldValue, to: tvShowResource)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvShowResource = theMovieDBAPI.tvResource?.topRated()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateObservation(from oldResource: Resource?, to newResource: Resource?) {
        guard oldResource != newResource else { return }
        oldResource?.removeObservers(ownedBy: self)
        newResource?
            .addObserver(self)
            .loadIfNeeded()
    }
    
    func updateUI(_ tvShow: TVShow){
        titleLabel.text = tvShow.name
        descriptionTextView.text = tvShow.overview
//        imageView.hnk_setImageFromURL("https://image.tmdb.org/t/p/original/\(tvShow.backdropPath ?? "")")
    }
    

}

extension TVShowViewController: ResourceObserver {
    
    func resourceChanged(_ resource: Resource, event: ResourceEvent) {
        guard let tvShow: TVShow = resource.typedContent() else {
            return
        }
        print(tvShow)
        updateUI(tvShow)
    }
    
}
