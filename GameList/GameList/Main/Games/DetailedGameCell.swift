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
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var gameGenreLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.customize(withType: .bordered)
        button.backgroundColor = AppColor.lightBlue
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DetailedGameCell configuration
extension DetailedGameCell {
    func configureCell(title: String, image: UIImage?, genres: String?, releaseDate: String?) {
        gameLogoView.image = image
        gameNameLabel.text = title
        gameGenreLabel.text = genres
        dateLabel.text = releaseDate
    }

    private func addSubviews() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(gameLogoView)
        contentView.addSubview(gameNameLabel)
        contentView.addSubview(gameGenreLabel)
        contentView.addSubview(addButton)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            gameLogoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gameLogoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            gameLogoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            gameLogoView.widthAnchor.constraint(equalToConstant: 70),

            gameNameLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            gameNameLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -10),

            gameGenreLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameGenreLabel.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 10),
            gameGenreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            dateLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            dateLabel.trailingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: -20),

            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
        ])
    }

    @objc private func didTapAddButton() {
        // delegate?.didTapAddButton()
    }
}
