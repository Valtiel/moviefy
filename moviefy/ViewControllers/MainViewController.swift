//
//  MainViewController.swift
//  moviefy
//
//  Created by César Rosales on 02/09/2018.
//  Copyright © 2018 César Rosales. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    var moviesListViewController: MoviesListViewController = MoviesListViewController()
    var tvShowsListViewController: TVShowsListViewController = TVShowsListViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesListViewController = (self.childViewControllers[0] as! UINavigationController).viewControllers[0] as! MoviesListViewController
        tvShowsListViewController = (self.childViewControllers[1] as! UINavigationController).viewControllers[0] as! TVShowsListViewController
    }
    
   
    
    

}
