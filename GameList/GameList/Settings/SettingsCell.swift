//
//  SettingsCell.swift
//  GameList
//
//  Created by Egor Lass on 05.07.2021.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(22)
        return label
    }()
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
