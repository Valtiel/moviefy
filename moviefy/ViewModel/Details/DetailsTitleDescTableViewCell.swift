//
//  DetailsTitleDescTableViewCell.swift
//  moviefy
//
//  Created by César Rosales on 04/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class DetailsTitleDescTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func prepareCellWith(title: String, description: String, on tableView: UITableView) -> DetailsTitleDescTableViewCell {
        let cell:DetailsTitleDescTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailsTitleDescTableViewCell") as! DetailsTitleDescTableViewCell
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        
        return cell
    }

}
