//
//  UISearchBar.swift
//  GameList
//
//  Created by Egor Lass on 26.07.2021.
//

import UIKit

extension UISearchBar {
    var compatibleSearchTextField: UITextField {
        guard #available(iOS 13.0, *) else { return legacySearchField }
        return self.searchTextField
    }
    private var legacySearchField: UITextField {
        if let textField = self.subviews.first?.subviews.last as? UITextField {
            return textField
        } else if let textField = self.value(forKey: "searchField") as? UITextField {
            return textField
        } else {
            return UITextField()
        }
    }
}
