//
//  InformationModel.swift
//  GameList
//
//  Created by Egor Lass on 15.07.2021.
//
import UIKit

extension InformationViewController {
    enum Website: String {
        case github = "https://github.com/EgorMezhin"
        case telegram = "https://t.me/Egorlass"
    }
}

extension InformationView {
    enum Title: String {
        case name = "Егор Межин"
        case job = "iOS разработчик"
        case github = "Github"
        case telegram = "Telegram"
        case photo = "https://basketball.businesschampions.ru/nox-data/teams/sap/players/mezhin_egor_2019-03-25.jpg"
    }
    static var cache = NSCache<NSString, UIImage>()
}
