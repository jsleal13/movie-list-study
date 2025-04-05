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
        view.tintColor = .darkGray
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemBackground
        let controllers = [buildHome(), buildFavorites()]
        viewControllers = controllers.map{ UINavigationController(rootViewController: $0)}
    }

    func buildHome() -> UIViewController {
        let homeViewController = HomeViewController(viewModel: HomeViewModel())
        homeViewController.tabBarItem = UITabBarItem(title: "Início", image: .add, tag: 0)

        return homeViewController
    }

    func buildFavorites() -> UIViewController {
        let favoritesViewController = ComingSoonViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favoritos", image: .checkmark, tag: 1)

        return favoritesViewController
    }
}
