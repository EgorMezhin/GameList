//
//  LibraryGameCell.swift
//  GameList
//
//  Created by Egor Lass on 30.07.2021.
//

import UIKit

class LibraryGameCell: UITableViewCell {
    private lazy var gameLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = AppColor.lightBlue
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var noImageLabel: UILabel = {
        let label = UILabel()
        label.text = "?"
        label.textColor = AppColor.blue
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.customize(withType: .bordered)
        button.backgroundColor = AppColor.lightBlue
        button.setImage(UIImage(systemName: "minus"), for: .normal)
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

// MARK: - SimpleGameCell configuration
extension LibraryGameCell {
    func configureCell(title: String, image: UIImage?) {
        gameLogoView.image = image
        gameNameLabel.text = title
    }

    private func addSubviews() {
        contentView.addSubview(gameLogoView)
        contentView.addSubview(gameNameLabel)
        gameLogoView.addSubview(noImageLabel)
        contentView.addSubview(addButton)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            gameLogoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            gameLogoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            gameLogoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            gameLogoView.widthAnchor.constraint(equalToConstant: 50),

            noImageLabel.centerYAnchor.constraint(equalTo: gameLogoView.centerYAnchor),
            noImageLabel.centerXAnchor.constraint(equalTo: gameLogoView.centerXAnchor),

            gameNameLabel.leadingAnchor.constraint(equalTo: gameLogoView.trailingAnchor, constant: 20),
            gameNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gameNameLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -20),

            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
        ])
    }

    @objc private func didTapAddButton() {
        // delegate?.didTapAddButton()
    }

}
