//
//  SettingsCell.swift
//  GameList
//
//  Created by Egor Lass on 05.07.2021.
//

import UIKit

class SettingsCell: UITableViewCell {

    private var settingTitle: UILabel = {
        let label = UILabel()
        label.text = "placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(22)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(settingTitle)
        setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsCell {
    func configureCell(with title: String) {
        settingTitle.text = title
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            settingTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            settingTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            settingTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
         //   settingTitle.widthAnchor.constraint(equalToConstant: 300),
            settingTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
