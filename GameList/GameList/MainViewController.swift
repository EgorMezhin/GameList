//
//  MainViewController.swift
//  GameList
//
//  Created by Egor Lass on 28.06.2021.
//

import UIKit

class MainViewController: UIViewController {

    private let tabBarCnt = UITabBarController()
    
    // MARK:  - View controller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        createTabBarController()
    }
    
    // MARK:  - TabBarController customization methods
    
    private func createTabBarController() {
        
        let firstVc = UIViewController()
        firstVc.view.backgroundColor = .cyan
        firstVc.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.first.rawValue,
            image: UIImage(systemName: Constants.VCImage.first.rawValue),
            tag: 0
        )
        
        let secondVc = UIViewController()
        secondVc.view.backgroundColor = .green
        secondVc.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.second.rawValue,
            image: UIImage(systemName: Constants.VCImage.second.rawValue),
            tag: 0
        )
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .lightGray
        thirdVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.third.rawValue,
            image: UIImage(systemName: Constants.VCImage.third.rawValue),
            tag: 0
        )
        
        let fourthVC = SettingsViewController()
        fourthVC.view.backgroundColor = .magenta
        fourthVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.fourth.rawValue,
            image: UIImage(systemName: Constants.VCImage.fourth.rawValue),
            tag: 0
        )
        
        let controllerArray = [
            firstVc,
            secondVc,
            thirdVC,
            fourthVC,
        ]
    
        tabBarCnt.viewControllers = controllerArray.map {
            UINavigationController.init(rootViewController: $0)
        }
        
        self.view.addSubview(tabBarCnt.view)
    }
}

// MARK: - TabBarController customization struct

fileprivate struct Constants {
    
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
