//
//  TabBarViewController.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = AppColors.highlightGreen
        tabBar.isTranslucent = false
        tabBar.backgroundColor = AppColors.black
        let controllers = [
            buildHome(),
            buildSaved(),
            buildDownloaded(),
            buildSearch()
        ]
        viewControllers = controllers.map{ UINavigationController(rootViewController: $0)}
    }

    func buildHome() -> UIViewController {
        let homeViewController = HomeViewController(viewModel: HomeViewModel())
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: .add, tag: 0)

        return homeViewController
    }

    func buildSaved() -> UIViewController {
        let comingSoonController = ComingSoonViewController()
        comingSoonController.tabBarItem = UITabBarItem(title: "Saved", image: .checkmark, tag: 1)

        return comingSoonController
    }

    func buildDownloaded() -> UIViewController {
        let downloadedController = ComingSoonViewController()
        downloadedController.tabBarItem = UITabBarItem(title: "Downloaded", image: .checkmark, tag: 2)

        return downloadedController
    }

    func buildSearch() -> UIViewController {
        let searchController = ComingSoonViewController()
        searchController.tabBarItem = UITabBarItem(title: "Search", image: .checkmark, tag: 3)

        return searchController
    }
}
