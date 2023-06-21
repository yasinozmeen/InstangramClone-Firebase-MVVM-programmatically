//
//  MainTabController.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 21.06.2023.
//

import UIKit.UITabBar

class MainTabController: UITabBarController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    // MARK: - Functions
    
    func configureViewController() {
        let feed = FeedController()
        let search = SearchController()
        let selectImage = ImageSelectorController()
        let notification = NotificationController()
        let profile = ProfileController()
        
        viewControllers = [feed, search, selectImage, notification, profile]
    }
}
