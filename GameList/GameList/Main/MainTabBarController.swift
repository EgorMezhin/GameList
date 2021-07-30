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
        tabBar.barTintColor = AppColor.lightBlue
        viewControllers = controllers
    }
}
