//
//  PopularCell.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class DetailedGameCell: UITableViewCell {

    let gameLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testGameLogoOne")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gothic"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let gameGenreLabel: UILabel = {
        let label = UILabel()
        label.text = "RPG, Action"
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "15.03.2001"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DetailedGameCell methods
extension DetailedGameCell {

    func addSubviews() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(gameLogoView)
        contentView.addSubview(gameNameLabel)
        contentView.addSubview(gameGenreLabel)
    }

    func setConstraint() {
        NSLayoutConstraint.activate([

            gameLogoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gameLogoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            gameLogoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            gameLogoView.widthAnchor.constraint(equalToConstant: 70),

            gameNameLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            gameNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            gameGenreLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameGenreLabel.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 10),
            gameGenreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            dateLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)

        ])
    }
}
