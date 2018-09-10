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

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:Array<Any> = Array()
    var resource: Resource? {
        didSet {
            updateObservation(from: oldValue, to: resource)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SpotlightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SpotlightCollectionViewCell")
        
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
        let cell:SpotlightCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpotlightCollectionViewCell", for: indexPath) as! SpotlightCollectionViewCell
        cell.item = dataSource[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width, height: 200)
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
