//
//  SettingsCell.swift
//  GameList
//
//  Created by Egor Lass on 05.07.2021.
//

import UIKit

final class SettingsCell: UITableViewCell {

    private lazy var settingTitle: UILabel = {
        let label = UILabel()
        label.text = "placeholder"
        label.font = label.font.withSize(22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var settingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setSubviews()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsCell {
    func configureCell(title: String, image: UIImage?) {
        settingTitle.text = title
        settingImage.image = image
    }
    private func setSubviews() {
        contentView.addSubview(settingTitle)
        contentView.addSubview(settingImage)
    }
    private func setConstraint() {
        NSLayoutConstraint.activate([
            settingTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            settingTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            settingTitle.trailingAnchor.constraint(equalTo: settingImage.leadingAnchor, constant: -15),
            settingTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            settingImage.heightAnchor.constraint(equalToConstant: 20),
            settingImage.widthAnchor.constraint(equalToConstant: 20),
            settingImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            settingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}
