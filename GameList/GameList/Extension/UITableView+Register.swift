//
//  UITableView+Register.swift
//  GameList
//
//  Created by Egor Lass on 18.07.2021.
//

import UIKit

extension UITableView {
    func registerCell(from cellType: Swift.AnyClass) {
        register(cellType.self, forCellReuseIdentifier: cellType.nameOfClass)
    }
    func dequeueReusableCell<Cell: UITableViewCell>(_ cellType: Cell.Type, indexPath: IndexPath) -> Cell? {
        dequeueReusableCell(withIdentifier: cellType.nameOfClass, for: indexPath) as? Cell
    }
}
