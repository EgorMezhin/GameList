//
//  SettingsModel.swift
//  GameList
//
//  Created by Egor Lass on 20.07.2021.
//

import UIKit

// MARK: - Variable Values
extension SettingsViewController {
     struct SettingModel {
        var text: String
        var image: UIImage?
        var selectionBlock: (() -> Void)?
    }
    enum SystemImage: String {
        case link = "external_link"
        case person = "person.fill"
        case rightArrow = "chevron.right"
    }
    enum CellTitle: String {
        case apiInfo = "Подробнее про igdb.com API"
        case appereance = "Оформление"
        case developerInfo = "О разработчике"
        case feedback = "Оставить отзыв"
        case logOut = "Выйти из учетной записи"
    }
}
