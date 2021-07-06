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
        label.font = label.font.withSize(12)
        return label
    }()
    
    let mounthLabel: UILabel = {
        let label = UILabel()
        label.text = "Июн"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = "2077"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(10)
        return label
    }()
    
    let gameLogoView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "PshePunk"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(14)
        return label
    }()
    
    let gameGenre: UILabel = {
        let label = UILabel()
        label.text = "RPG"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cityLabel)
        contentView.addSubview(button)
        setConstraint()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cityLabel.widthAnchor.constraint(equalToConstant: 150),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            button.topAnchor.constraint(equalTo: cityLabel.topAnchor),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.bottomAnchor.constraint(equalTo: cityLabel.bottomAnchor)
        ])
    }
}
