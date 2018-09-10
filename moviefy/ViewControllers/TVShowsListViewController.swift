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
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "DefaultListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DefaultListCollectionViewCell")
        guard let tvResource = theMovieDBAPI.tvResource else {
            return
        }
        dataSource = ["Popular":tvResource.popular(),
                      "Top Rated":tvResource.topRated(),
                      "On The Air":tvResource.onTheAir(),
                      "Airing Today":tvResource.airingToday()]
        self.collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
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
        let cell:DefaultListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultListCollectionViewCell", for: indexPath) as! DefaultListCollectionViewCell
        cell.resource = dataSource[Array(dataSource.keys)[indexPath.section]]!
        cell.button.setTitle(Array(dataSource.keys)[indexPath.section], for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGSize = self.view.frame.size
        size.height = size.height * 0.3
//        size.width = size.width/3
        return size
    }
}
