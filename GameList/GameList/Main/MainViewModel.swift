//
//  MainViewModel.swift
//  GameList
//
//  Created by Egor Lass on 21.07.2021.
//

import UIKit

// TODO: new name for MARK?
// MARK: - MainViewController Variable Values
extension MainViewController {
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
