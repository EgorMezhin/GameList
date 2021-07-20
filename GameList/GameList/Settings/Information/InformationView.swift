//
//  InformationView.swift
//  GameList
//
//  Created by Egor Lass on 15.07.2021.
//

import UIKit

final class InformationView: UIView {
    weak var delegate: InformationViewDelegate?
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Егор Межин"
        label.font = label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var photoView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .green
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var githubButton: UIButton = {
        let button = UIButton()
        button.customize(withType: .bordered)
        button.setTitle("Github", for: .normal)
        button.addTarget(self, action: #selector(didTapGithubButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var telegramButton: UIButton = {
        let button = UIButton()
        button.customize(withType: .bordered)
        button.setTitle("Telegram", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapTelegramButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - InformationViewDelegate Methods
extension InformationView {
    @objc private func didTapGithubButton() {
        delegate?.didTapGithubButton()
    }
    @objc private func didTapTelegramButton() {
        delegate?.didTapTelegramButton()
    }
}

// MARK: - Initialization
extension InformationView {
    private func initialize() {
        addSubview(nameLabel)
        addSubview(photoView)
        addSubview(githubButton)
        addSubview(telegramButton)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            photoView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            photoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoView.widthAnchor.constraint(equalToConstant: 200),
            photoView.heightAnchor.constraint(equalToConstant: 250),
            githubButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            githubButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            githubButton.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 40),
            githubButton.heightAnchor.constraint(equalToConstant: 60),
            telegramButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            telegramButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            telegramButton.topAnchor.constraint(equalTo: githubButton.topAnchor),
            telegramButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
