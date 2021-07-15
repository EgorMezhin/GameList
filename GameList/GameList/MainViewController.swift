//
//  MainViewController.swift
//  GameList
//
//  Created by Egor Lass on 28.06.2021.
//

import UIKit

class MainViewController: UIViewController {

    private let tabBarCnt = UITabBarController()
    
    // MARK:  - ViewСontroller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        createTabBarController()
    }
    
    // MARK:  - TabBarController customization methods
    
    private func createTabBarController() {
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .cyan
        firstVC.title = Constants.VCTitle.first.rawValue

        firstVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.first.rawValue,
            image: UIImage(systemName: Constants.VCImage.first.rawValue),
            tag: 0
        )
        
        let secondVC = PopularViewController()
        secondVC.view.backgroundColor = .green
        secondVC.title = Constants.VCTitle.second.rawValue
        secondVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.second.rawValue,
            image: UIImage(systemName: Constants.VCImage.second.rawValue),
            tag: 0
        )
        
        let thirdVC = NewGamesViewController()
        thirdVC.view.backgroundColor = .lightGray
        
        thirdVC.title = Constants.VCTitle.third.rawValue
        thirdVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.third.rawValue,
            image: UIImage(systemName: Constants.VCImage.third.rawValue),
            tag: 0
        )
        
        let fourthVC = SettingsViewController()
        fourthVC.view.backgroundColor = .magenta
        fourthVC.title = Constants.VCTitle.fourth.rawValue
        fourthVC.tabBarItem = UITabBarItem.init(
            title: Constants.VCTitle.fourth.rawValue,
            image: UIImage(systemName: Constants.VCImage.fourth.rawValue),
            tag: 0
        )
        
        let controllerArray = [
            firstVC,
            secondVC,
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
