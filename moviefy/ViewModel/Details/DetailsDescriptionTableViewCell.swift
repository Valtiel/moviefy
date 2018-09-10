//
//  DetailsDescriptionTableViewCell.swift
//  moviefy
//
//  Created by César Rosales on 04/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class DetailsDescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    class func prepareCellWith(description: String, on tableView: UITableView) -> DetailsDescriptionTableViewCell {
        let cell:DetailsDescriptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DetailsDescriptionTableViewCell") as! DetailsDescriptionTableViewCell
        cell.label.text = description
        
        return cell
    }
    
}
