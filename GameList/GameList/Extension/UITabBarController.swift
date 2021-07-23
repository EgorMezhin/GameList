//
//  UITabBarController.swift
//  GameList
//
//  Created by Egor Lass on 23.07.2021.
//

import UIKit

extension UITabBarController {
    func setupVC(type: UIViewController, title: String, item: UITabBarItem) -> UIViewController {
        let viewController = type
        viewController.title = title
        viewController.tabBarItem = item
        return viewController
    }
}
