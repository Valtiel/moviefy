//
//  TVShowsListViewController.swift
//  moviefy
//
//  Created by César Rosales on 03/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit
import Siesta

class TVShowsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: Dictionary<String, Resource> = Dictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self as UICollectionViewDataSource
        self.collectionView.delegate = self as UICollectionViewDelegate
        self.collectionView.register(UINib.init(nibName: "SpotlightListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SpotlightListCollectionViewCell")
        self.collectionView.register(UINib.init(nibName: "HeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeaderCollectionViewCell")
        guard let tvResource = theMovieDBAPI.tvResource else {
            return
        }
        dataSource = ["Popular":tvResource.popular(),
                      "Top Rated":tvResource.topRated(),
                      "On The Air":tvResource.onTheAir(),
                      "Airing Today":tvResource.airingToday()]
        self.collectionView.reloadData()
    }

}

extension TVShowsListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SpotlightListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpotlightListCollectionViewCell", for: indexPath) as! SpotlightListCollectionViewCell
        cell.resource = dataSource[Array(dataSource.keys)[indexPath.section]]!
        cell.titleLabel.text = Array(dataSource.keys)[indexPath.section]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGSize = self.view.frame.size
        size.height = size.height * 0.3
        return size
    }
}
