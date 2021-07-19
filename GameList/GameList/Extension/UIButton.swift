//
//  UIButton.swift
//  GameList
//
//  Created by Egor Lass on 19.07.2021.
//

import UIKit

extension UIButton {
    func customize(withType type: CustomizeButtonType) {
        switch type {
        case .bordered:
            setTitleColor(.black, for: .normal)
            layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
            layer.borderWidth = 3
            layer.cornerRadius = 10
            layer.masksToBounds = true
        }
    }
    
    enum CustomizeButtonType {
        case bordered
    }
}