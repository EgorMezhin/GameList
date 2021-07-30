//
//  GameView.swift
//  GameList
//
//  Created by Egor Lass on 23.07.2021.
//

import UIKit

final class GameView: UIView {
    weak var delegate: GameViewDelegate?
    private lazy var gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Mass Effect: Legendary Edition"
        label.font = label.font.withSize(22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var ratingHeadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Рейтинг"
        label.textAlignment = .center
        label.font = label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "90"
        label.textAlignment = .center
        label.font = label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var gameLogo: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .cyan
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.customize(withType: .bordered)
        button.setTitle("Добавить в библиотеку", for: .normal)
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var descriptionHeadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.text = """
                        Компьютерная игра в жанре ролевого боевика, разработанная студией BioWare и
                        выпущенная Microsoft Game Studios в 2007 году, первая часть серии
                        Mass Effect.
                        """
        textView.font = .systemFont(ofSize: 18)
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        descriptionLabel.delegate = self
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - GameViewDelegate methods
extension GameView {
    @objc private func didTapAddButton() {
        delegate?.didTapAddButton()
    }
}

extension GameView: UITextViewDelegate {
}

// MARK: - GameView configuration
extension GameView {
    private func configure() {
        addSubview(gameNameLabel)
        addSubview(ratingHeadingLabel)
        addSubview(ratingLabel)
        addSubview(gameLogo)
        addSubview(addButton)
        addSubview(descriptionHeadingLabel)
        addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            gameNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),

            gameLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            gameLogo.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 20),
            gameLogo.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            gameLogo.heightAnchor.constraint(equalTo: gameLogo.widthAnchor, multiplier: 1.3),

            ratingHeadingLabel.centerYAnchor.constraint(equalTo: gameLogo.centerYAnchor, constant: -20),
            ratingHeadingLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            ratingHeadingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            ratingLabel.centerYAnchor.constraint(equalTo: gameLogo.centerYAnchor, constant: 20),
            ratingLabel.centerXAnchor.constraint(equalTo: ratingHeadingLabel.centerXAnchor),

            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            addButton.topAnchor.constraint(equalTo: gameLogo.bottomAnchor, constant: 20),
            addButton.heightAnchor.constraint(equalToConstant: 30),

            descriptionHeadingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionHeadingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionHeadingLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20),

            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionHeadingLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionHeadingLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionHeadingLabel.bottomAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
