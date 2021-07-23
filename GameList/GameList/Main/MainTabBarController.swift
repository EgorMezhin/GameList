//
//  MainTabBarController.swift
//  GameList
//
//  Created by Egor Lass on 28.06.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    private lazy var controllers = [
        UINavigationController(rootViewController: configureLibraryVC()),
        UINavigationController(rootViewController: configureGamesVC()),
        UINavigationController(rootViewController: configureSearchVC()),
        UINavigationController(rootViewController: configureSettingsVC())
    ]

    // MARK: - ViewСontroller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = controllers
    }

    private func configureLibraryVC() -> UIViewController {
        let libraryVC = LibraryViewController()
        libraryVC.title = VCTitle.library.rawValue
        libraryVC.tabBarItem = .init(
            title: VCTitle.library.rawValue,
            image: UIImage(systemName: VCImage.gamecontroller.rawValue),
            tag: 0
        )
        return libraryVC
    }

    private func configureGamesVC() -> UIViewController {
        let gamesVC = GamesViewController()
        gamesVC.title = VCTitle.popular.rawValue
        gamesVC.tabBarItem = .init(
            title: VCTitle.popular.rawValue,
            image: UIImage(systemName: VCImage.chartBar.rawValue),
            tag: 0
        )
        return gamesVC
    }

    private func configureSearchVC() -> UIViewController {
        let searchVC = SearchViewController()
        searchVC.title = VCTitle.search.rawValue
        searchVC.tabBarItem = .init(
            title: VCTitle.search.rawValue,
            image: UIImage(systemName: VCImage.magnifyingglass.rawValue),
            tag: 0
        )
        return searchVC
    }

    private func configureSettingsVC() -> UIViewController {
        let settingsVC = SettingsViewController()
        settingsVC.title = VCTitle.settings.rawValue
        settingsVC.tabBarItem = .init(
            title: VCTitle.settings.rawValue,
            image: UIImage(systemName: VCImage.gear.rawValue),
            tag: 0
        )
        return settingsVC
    }
}
