//
//  NSObject+NameOfClass.swift
//  GameList
//
//  Created by Egor Lass on 18.07.2021.
//

import Foundation

extension NSObject {
    @objc class var nameOfClass: String {
        NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
    
    var nameOfClass: String {
        NSStringFromClass(type(of: self)).components(separatedBy: ".").last ?? ""
    }
}
