//
//  MainModel.swift
//  GameList
//
//  Created by Egor Lass on 21.07.2021.
//

import UIKit

extension MainTabBarController {
    struct TabBarItems {
        static let library = UITabBarItem(
            title: VCTitle.library.rawValue,
            image: UIImage(systemName: VCImage.gamecontroller.rawValue),
            tag: 0
        )
        static let games = UITabBarItem(
            title: VCTitle.popular.rawValue,
            image: UIImage(systemName: VCImage.chartBar.rawValue),
            tag: 0
        )
        static let seacrh = UITabBarItem(
            title: VCTitle.search.rawValue,
            image: UIImage(systemName: VCImage.magnifyingglass.rawValue),
            tag: 0
        )
        static let settings = UITabBarItem(
            title: VCTitle.settings.rawValue,
            image: UIImage(systemName: VCImage.gear.rawValue),
            tag: 0
        )
    }

    enum VCTitle: String {
        case library = "Библиотека"
        case popular = "Лучшее"
        case search = "Поиск"
        case settings = "Настройки"
    }

    enum VCImage: String {
        case chartBar = "chart.bar.fill"
        case gamecontroller = "gamecontroller.fill"
        case gear = "gearshape.fill"
        case magnifyingglass = "magnifyingglass"
    }
}
