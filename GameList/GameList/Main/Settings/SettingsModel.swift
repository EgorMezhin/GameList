//
//  SettingsModel.swift
//  GameList
//
//  Created by Egor Lass on 20.07.2021.
//

import UIKit

extension SettingsViewController {
    struct SettingModel {
        var text: String
        var image: UIImage?
        var selectionBlock: (() -> Void)?
    }

    struct Constants {
        static let apiUrl = "https://www.igdb.com/api"
        static let feedbackUrl = "https://t.me/GameListFeedbackBot"
        static let cellHeight: CGFloat = 50
    }

    enum SystemImage: String {
        case link = "external_link"
        case person = "person.fill"
        case rightArrow = "chevron.right"
    }

    enum SettingCellTitle: String {
        case apiInfo = "Подробнее про igdb API"
        case appereance = "Оформление"
        case developerInfo = "О разработчике"
        case feedback = "Оставить отзыв"
        case logOut = "Выйти из учетной записи"
    }
}
