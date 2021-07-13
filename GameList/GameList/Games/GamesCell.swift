//
//  GamesCell.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class GamesCell: UITableViewCell {
    
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "09"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        return label
    }()
    
    let mounthLabel: UILabel = {
        let label = UILabel()
        label.text = "Июн"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2077"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        return label
    }()
    
    let gameLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    let gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "PshePunka dlawfc azxcvfds dfv"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(20)
        return label
    }()
    
    let gameGenreLabel: UILabel = {
        let label = UILabel()
        label.text = "RPG"
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
    
    func addSubviews() {
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
            gameNameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            gameGenreLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameGenreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
            gameGenreLabel.widthAnchor.constraint(equalToConstant: 150),
            
            actionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 50),
            actionButton.widthAnchor.constraint(equalToConstant: 50),
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
            
        ])
    }
}

