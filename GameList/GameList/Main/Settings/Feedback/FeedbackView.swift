//
//  FeedbackView.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class FeedbackView: UIView {
    weak var delegate: FeedbackViewDelegate?
    private lazy var feedbackTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = AppColor.blue.cgColor
        textView.layer.cornerRadius = 8
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
        button.addTarget(self, action: #selector(didTapFeedbackButton), for: .touchUpInside)
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

// MARK: - FeedbackViewDelegate methods
extension FeedbackView {
    @objc private func didTapFeedbackButton() {
        delegate?.didTapFeedbackButton()
    }
}

// MARK: - Initialization
extension FeedbackView {
    private func initialize() {
        feedbackTextView.delegate = self
        addSubview(feedbackTextView)
        addSubview(feedbackButton)
        NSLayoutConstraint.activate([
            feedbackTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            feedbackTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            feedbackTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            feedbackTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

            feedbackButton.widthAnchor.constraint(equalTo: feedbackTextView.widthAnchor),
            feedbackButton.heightAnchor.constraint(equalToConstant: 40),
            feedbackButton.topAnchor.constraint(equalTo: feedbackTextView.bottomAnchor, constant: 20),
            feedbackButton.centerXAnchor.constraint(equalTo: feedbackTextView.centerXAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate methods
extension FeedbackView: UITextViewDelegate {
}
