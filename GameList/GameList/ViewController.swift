//
//  ViewController.swift
//  GameList
//
//  Created by Egor Lass on 28.06.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        createTabBarController()
    }
    
    func createTabBarController() {
        
        let tabBarCnt = UITabBarController()
        tabBarCnt.tabBar.tintColor = UIColor.black
        
        let firstVc = UIViewController()
        firstVc.tabBarItem = UITabBarItem.init(
            title: "Библиотека",
            image: UIImage(systemName: "gamecontroller.fill"),
            tag: 0)
        
        let secondVc = UIViewController()
        secondVc.tabBarItem = UITabBarItem.init(
            title: "Популярное",
            image: UIImage(systemName: "chart.bar.fill"),
            tag: 0)
        
        let thirdVC = UIViewController()
        thirdVC.tabBarItem = UITabBarItem.init(
            title: "Новинки",
            image: UIImage(systemName: "calendar"),
            tag: 0)
        
        let fourthVC = UIViewController()
        fourthVC.tabBarItem = UITabBarItem.init(
            title: "Ещё",
            image: UIImage(systemName: "gearshape.fill"),
            tag: 0)
        
        tabBarCnt.viewControllers = [
            firstVc,
            secondVc,
            thirdVC,
            fourthVC,
        ]
        
        self.view.addSubview(tabBarCnt.view)
    }
    
    
    
}

