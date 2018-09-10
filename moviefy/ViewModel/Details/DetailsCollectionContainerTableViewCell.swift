//
//  DetailsCollectionContainerTableViewCell.swift
//  moviefy
//
//  Created by César Rosales on 04/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class DetailsCollectionContainerTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var array:[Any]? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (array?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    class func prepareCellWith(array: [Any], on tableView: UITableView) -> DetailsCollectionContainerTableViewCell {
        let cell:DetailsCollectionContainerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailsTitleTableViewCell") as! DetailsCollectionContainerTableViewCell
        cell.array = array
        
        return cell
    }

}
