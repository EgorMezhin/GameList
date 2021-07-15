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

        createTabBarController()
    }

    // MARK: - TabBarController customization methods

    private func createTabBarController() {

        let libraryVC = UIViewController()
        libraryVC.view.backgroundColor = .cyan
        libraryVC.title = Constants.VCTitle.first.rawValue
        libraryVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.first.rawValue,
            image: UIImage(systemName: Constants.VCImage.first.rawValue),
            tag: 0
        )

        let popularVC = PopularViewController()
        popularVC.view.backgroundColor = .green
        popularVC.title = Constants.VCTitle.second.rawValue
        popularVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.second.rawValue,
            image: UIImage(systemName: Constants.VCImage.second.rawValue),
            tag: 0
        )

        let newGamesVC = NewGamesViewController()
        newGamesVC.view.backgroundColor = .lightGray
        newGamesVC.title = Constants.VCTitle.third.rawValue
        newGamesVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.third.rawValue,
            image: UIImage(systemName: Constants.VCImage.third.rawValue),
            tag: 0
        )

        let settingsVC = SettingsViewController()
        settingsVC.view.backgroundColor = .magenta
        settingsVC.title = Constants.VCTitle.fourth.rawValue
        settingsVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.fourth.rawValue,
            image: UIImage(systemName: Constants.VCImage.fourth.rawValue),
            tag: 0
        )

        let controllers = [
            libraryVC,
            popularVC,
            newGamesVC,
            settingsVC
        ]

        tabBarCnt.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }

        self.view.addSubview(tabBarCnt.view)
    }
}

// MARK: - TabBarController customization struct

private struct Constants {

    enum VCTitle: String {
        case first = "Библиотека"
        case second = "Популярное"
        case third = "Новинки"
        case fourth = "Настройки"
    }

    enum VCImage: String {
        case first = "gamecontroller.fill"
        case second = "chart.bar.fill"
        case third = "calendar"
        case fourth = "gearshape.fill"
    }
}
