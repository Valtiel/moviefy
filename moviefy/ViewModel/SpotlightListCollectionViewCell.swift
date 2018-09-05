//
//  SpotlightListCollectionViewCell.swift
//  moviefy
//
//  Created by César Rosales on 03/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit
import Siesta

class SpotlightListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:Array<TVShow> = Array()
    var resource: Resource? {
        didSet {
            updateObservation(from: oldValue, to: resource)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "SpotlightMovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SpotlightMovieCollectionViewCell")
        
    }
    
    private func updateObservation(from oldResource: Resource?, to newResource: Resource?) {
        guard oldResource != newResource else { return }
        oldResource?.removeObservers(ownedBy: self)
        newResource?
            .addObserver(self)
            .loadIfNeeded()
    }
    
}

extension SpotlightListCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SpotlightMovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpotlightMovieCollectionViewCell", for: indexPath) as! SpotlightMovieCollectionViewCell
        cell.object = dataSource[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        DetailsViewController.pushDetails(for: dataSource[indexPath.row])
        
    }
}

extension SpotlightListCollectionViewCell: ResourceObserver {
    func resourceChanged(_ resource: Resource, event: ResourceEvent) {
        guard let content: Array<TVShow> = resource.typedContent() else {
            return
        }
        dataSource = content
        self.collectionView.reloadData()
    }
    
    
}
