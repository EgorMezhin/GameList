//
//  GamesCell.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class NewGameCell: UITableViewCell {

    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "21"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let mounthLabel: UILabel = {
        let label = UILabel()
        label.text = "Июн"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2077"
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let gameLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "PshePunka dlawfc azx 2"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let gameGenreLabel: UILabel = {
        let label = UILabel()
        label.text = "RPG, Simulator, Strategy"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        return label
    }()

    let actionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(mounthLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(gameLogoView)
        contentView.addSubview(gameNameLabel)
        contentView.addSubview(gameGenreLabel)
        contentView.addSubview(actionButton)
    }

    func setConstraint() {
        NSLayoutConstraint.activate([

            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            dayLabel.bottomAnchor.constraint(equalTo: mounthLabel.topAnchor, constant: -10),
            dayLabel.widthAnchor.constraint(equalToConstant: 30),

            mounthLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            mounthLabel.centerXAnchor.constraint(equalTo: dayLabel.centerXAnchor),
            mounthLabel.widthAnchor.constraint(equalToConstant: 50),

            yearLabel.topAnchor.constraint(equalTo: mounthLabel.bottomAnchor, constant: 10),
            yearLabel.centerXAnchor.constraint(equalTo: dayLabel.centerXAnchor),
            yearLabel.widthAnchor.constraint(equalToConstant: 50),

            gameLogoView.leadingAnchor.constraint(equalTo: mounthLabel.trailingAnchor, constant: 20),
            gameLogoView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            gameLogoView.widthAnchor.constraint(equalToConstant: 100),

            gameNameLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),
            gameNameLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -20),

            gameGenreLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameGenreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
            gameGenreLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -20),

            actionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 50),
            actionButton.widthAnchor.constraint(equalToConstant: 50),
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)

        ])
    }
}
