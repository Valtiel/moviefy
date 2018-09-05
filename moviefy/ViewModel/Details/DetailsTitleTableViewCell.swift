//
//  DetailsTitleTableViewCell.swift
//  moviefy
//
//  Created by César Rosales on 04/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class DetailsTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func prepareCellWith(title: String, on tableView: UITableView) -> DetailsTitleTableViewCell {
        let cell:DetailsTitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailsTitleTableViewCell") as! DetailsTitleTableViewCell
        cell.label.text = title
        
        return cell
    }

}
