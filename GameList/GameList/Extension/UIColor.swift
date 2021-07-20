//
//  UIColor.swift
//  GameList
//
//  Created by Egor Lass on 20.07.2021.
//

import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
