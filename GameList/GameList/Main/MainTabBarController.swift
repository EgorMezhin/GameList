//
//  MainTabBarController.swift
//  GameList
//
//  Created by Egor Lass on 28.06.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    private lazy var controllers = [
        UINavigationController(rootViewController: setupVC(
            type: LibraryViewController(),
            title: VCTitle.library.rawValue,
            item: TabBarItems.library)
        ),
        UINavigationController(rootViewController: setupVC(
            type: GamesViewController(),
            title: VCTitle.popular.rawValue,
            item: TabBarItems.games)
        ),
        UINavigationController(rootViewController: setupVC(
            type: SearchViewController(),
            title: VCTitle.search.rawValue,
            item: TabBarItems.seacrh)
        ),
        UINavigationController(rootViewController: setupVC(
            type: SettingsViewController(),
            title: VCTitle.settings.rawValue,
            item: TabBarItems.settings)
        )
    ]

    // MARK: - TabBarСontroller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = controllers
    }

    // MARK: - ViewControllers setup
//    private func setupLibraryVC() -> UIViewController {
//        // TODO: separate func
//        let libraryVC = LibraryViewController()
//        libraryVC.title = VCTitle.library.rawValue
//        libraryVC.tabBarItem = .init(
//            title: VCTitle.library.rawValue,
//            image: UIImage(systemName: VCImage.gamecontroller.rawValue),
//            tag: 0
//        )
//        return libraryVC
//    }
//
//    private func setupGamesVC() -> UIViewController {
//        let gamesVC = GamesViewController()
//        gamesVC.title = VCTitle.popular.rawValue
//        gamesVC.tabBarItem = .init(
//            title: VCTitle.popular.rawValue,
//            image: UIImage(systemName: VCImage.chartBar.rawValue),
//            tag: 0
//        )
//        return gamesVC
//    }
//
//    private func setupSearchVC() -> UIViewController {
//        let searchVC = SearchViewController()
//        searchVC.title = VCTitle.search.rawValue
//        searchVC.tabBarItem = .init(
//            title: VCTitle.search.rawValue,
//            image: UIImage(systemName: VCImage.magnifyingglass.rawValue),
//            tag: 0
//        )
//        return searchVC
//    }
//
//    private func setupSettingsVC() -> UIViewController {
//        let settingsVC = SettingsViewController()
//        settingsVC.title = VCTitle.settings.rawValue
//        settingsVC.tabBarItem = .init(
//            title: VCTitle.settings.rawValue,
//            image: UIImage(systemName: VCImage.gear.rawValue),
//            tag: 0
//        )
//        return settingsVC
//    }

}

extension UITabBarController {
    func setupVC(type: UIViewController, title: String, item: UITabBarItem) -> UIViewController {
        let viewController = type
        viewController.title = title
        viewController.tabBarItem = item
        return viewController
    }
}
