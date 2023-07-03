//
//  MainTabController.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 21.06.2023.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        chackIfUserISLoggedIn()
//        logout()
    }
    // MARK: - API
    func chackIfUserISLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        }
    }
    
    // MARK: - Functions
    func configureViewController() {
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let extractedExpr = #imageLiteral(resourceName: "home_unselected")
        let feed = templateNavigationController(unselectedImage: extractedExpr,
                                                selectedImage: #imageLiteral(resourceName: "home_selected"),
                                                rootViewController: FeedController(collectionViewLayout: layout))
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"),
                                                  selectedImage: #imageLiteral(resourceName: "search_selected"),
                                                  rootViewController: SearchController())
        let selectImage = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"),
                                                       selectedImage: #imageLiteral(resourceName: "plus_unselected"),
                                                       rootViewController: ImageSelectorController())
        let notification = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"),
                                                        selectedImage: #imageLiteral(resourceName: "like_selected"),
                                                        rootViewController: NotificationController())
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"),
                                                   selectedImage: #imageLiteral(resourceName: "profile_selected"),
                                                   rootViewController: ProfileController())
        
        viewControllers = [feed, search, selectImage, notification, profile]
        tabBar.backgroundColor = .white.withAlphaComponent(0.9)
        tabBar.tintColor = .black
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}
