//
//  MoviesListViewController.swift
//  moviefy
//
//  Created by César Rosales on 03/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: Dictionary<String, Array<Movie>> = Dictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self as? UICollectionViewDataSource
        self.collectionView.delegate = self as? UICollectionViewDelegate
        // Do any additional setup after loading the view.
    }
    
    func prepareDataSourceStructure() {
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[Array(dataSource.keys)[section]]!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}
