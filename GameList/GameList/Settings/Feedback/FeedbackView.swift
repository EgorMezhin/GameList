//
//  FeedbackView.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class FeedbackView: UIView {
    weak var delegate: FeedbackViewDelegate?
    private lazy var feedbackField: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        textView.layer.cornerRadius = 10
        textView.autocorrectionType = .no
        textView.keyboardType = .default
        textView.returnKeyType = .send
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    private lazy var feedbackButton: UIButton = {
        let button = UIButton()
        button.customize(withType: .bordered)
        button.setTitle(feedbackButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(didTabFeedbackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
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

// MARK: - FeedbackViewDelegate Methods
extension FeedbackView {
    @objc private func didTabFeedbackButton() {
        delegate?.didTabFeedbackButton()
    }
}

// MARK: - Initialization
extension FeedbackView {
    private func initialize() {
        feedbackField.delegate = self
        addSubview(feedbackField)
        addSubview(feedbackButton)
        NSLayoutConstraint.activate([
            feedbackField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            feedbackField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            feedbackField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            feedbackField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            feedbackButton.widthAnchor.constraint(equalTo: feedbackField.widthAnchor),
            feedbackButton.heightAnchor.constraint(equalToConstant: 40),
            feedbackButton.topAnchor.constraint(equalTo: feedbackField.bottomAnchor, constant: 20),
            feedbackButton.centerXAnchor.constraint(equalTo: feedbackField.centerXAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate methods
extension FeedbackView: UITextViewDelegate {
}
