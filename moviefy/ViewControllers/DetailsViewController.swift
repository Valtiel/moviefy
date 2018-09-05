//
//  DetailsViewController.swift
//  moviefy
//
//  Created by César Rosales on 04/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyUtils

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var object:Any? = nil
    var dataSource:Dictionary<String, [Any]> = Dictionary()
    var imageView: UIImageView! = UIImageView.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = .init()
        
        tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0)
        imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        viewConstructor()
        
    }
    
    func viewConstructor() {
        if object is TVShow {
            dataSource = TVShowsDetailsViewModel.init(tvs: object as! TVShow).detailsDataSource(for: tableView)
            
            self.title = (object as! TVShow).name
            
            imageView.sd_setImage(with: TVShowsDetailsViewModel.init(tvs: object as! TVShow).imageURL())
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y:CGFloat = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 1000)
        imageView.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: Int(height))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[Array(dataSource.keys)[section]]!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Array(dataSource.keys).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource[Array(dataSource.keys)[indexPath.section]]![indexPath.row] as! UITableViewCell
    }
    
    class func pushDetails(for object:Any) {
        let details:DetailsViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        details.object = object
        UIApplication.shared.topViewController()?.navigationController?.pushViewController(details, animated: true)
    }

}
