//
//  SimpleGameCell.swift
//  GameList
//
//  Created by Egor Lass on 21.07.2021.
//

import UIKit

class SimpleGameCell: UITableViewCell {
    let gameLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testGameLogoTwo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Archlion Saga"
        label.font = .systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SimpleGameCell configuration
extension SimpleGameCell {
    func configureCell(title: String, image: UIImage?) {
        gameLogoView.image = image
        gameNameLabel.text = title
    }

    private func setSubviews() {
        contentView.addSubview(gameLogoView)
        contentView.addSubview(gameNameLabel)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            gameLogoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gameLogoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            gameLogoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            gameLogoView.widthAnchor.constraint(equalToConstant: 40),

            gameNameLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gameNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
