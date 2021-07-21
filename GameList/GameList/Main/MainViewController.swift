//
//  MainViewController.swift
//  GameList
//
//  Created by Egor Lass on 28.06.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let tabBarCnt = UITabBarController()

    // MARK: - ViewСontroller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarController()
    }

    // MARK: - TabBarController customization methods
    private func configureTabBarController() {
        let libraryVC = LibraryViewController()
        libraryVC.title = VCTitle.library.rawValue
        libraryVC.tabBarItem = UITabBarItem(
            title: VCTitle.library.rawValue,
            image: UIImage(systemName: VCImage.gamecontroller.rawValue),
            tag: 0
        )

        let gamesVC = GamesViewController()
        gamesVC.title = VCTitle.popular.rawValue
        gamesVC.tabBarItem = UITabBarItem.init(
            title: VCTitle.popular.rawValue,
            image: UIImage(systemName: VCImage.chartBar.rawValue),
            tag: 0
        )

        let searchVC = SearchViewController()
        searchVC.title = VCTitle.search.rawValue
        searchVC.tabBarItem = UITabBarItem.init(
            title: VCTitle.search.rawValue,
            image: UIImage(systemName: VCImage.magnifyingglass.rawValue),
            tag: 0
        )

        let settingsVC = SettingsViewController()
        settingsVC.title = VCTitle.settings.rawValue
        settingsVC.tabBarItem = UITabBarItem.init(
            title: VCTitle.settings.rawValue,
            image: UIImage(systemName: VCImage.gear.rawValue),
            tag: 0
        )

        let controllers = [
            libraryVC,
            gamesVC,
            searchVC,
            settingsVC
        ]

        tabBarCnt.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        view.addSubview(tabBarCnt.view)
    }
}
