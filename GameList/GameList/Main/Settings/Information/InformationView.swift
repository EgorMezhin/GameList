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
        label.text = Title.name.rawValue
        label.font = label.font.withSize(22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var developerLabel: UILabel = {
        let label = UILabel()
        label.text = Title.job.rawValue
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var photoView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var githubButton: UIButton = {
        let button = UIButton()
        button.customize(withType: .bordered)
        button.setTitle(Title.github.rawValue, for: .normal)
        button.addTarget(self, action: #selector(didTapGithubButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var telegramButton: UIButton = {
        let button = UIButton()
        button.customize(withType: .bordered)
        button.setTitle(Title.telegram.rawValue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapTelegramButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
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

// MARK: - InformationView configuration
extension InformationView {
    private func configureView() {
        loadImage()
        addSubview(nameLabel)
        addSubview(developerLabel)
        addSubview(photoView)
        addSubview(githubButton)
        addSubview(telegramButton)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),

            developerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            developerLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

            photoView.topAnchor.constraint(equalTo: developerLabel.bottomAnchor, constant: 20),
            photoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoView.widthAnchor.constraint(equalToConstant: 200),
            photoView.heightAnchor.constraint(equalToConstant: 250),

            githubButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            githubButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            githubButton.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 20),
            githubButton.heightAnchor.constraint(equalToConstant: 50),

            telegramButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            telegramButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            telegramButton.topAnchor.constraint(equalTo: githubButton.topAnchor),
            telegramButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func loadImage() {
        if let image = InformationView.cache.object(forKey: "image" as NSString) {
            DispatchQueue.main.async { [weak self] in
                self?.photoView.image = image
            }
        } else {
            if let url = URL(string: Title.photo.rawValue) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard
                        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                        let data = data, error == nil,
                        let image = UIImage(data: data)
                    else { return }
                    InformationView.cache.setObject(image, forKey: "image" as NSString)
                    DispatchQueue.main.async { [weak self] in
                        self?.photoView.image = InformationView.cache.object(forKey: "image")
                    }
                }.resume()
            }
        }
    }
}
