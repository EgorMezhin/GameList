//
//  UIButton.swift
//  GameList
//
//  Created by Egor Lass on 19.07.2021.
//

import UIKit

extension UIButton {
    enum CustomizeButtonType {
        case bordered
    }

    func customize(withType type: CustomizeButtonType) {
        switch type {
        case .bordered:
            setTitleColor(AppColor.white, for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 18)
            layer.backgroundColor = AppColor.blue.cgColor
            layer.cornerRadius = 8
            layer.masksToBounds = true
        }
    }
}
