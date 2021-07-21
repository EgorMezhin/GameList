//
//  FeedbackViewController.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class FeedbackViewController: UIViewController {

    private lazy var feedbackView: FeedbackView = {
        let view = FeedbackView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - FeedbackViewController Methods
extension FeedbackViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(feedbackView)
        NSLayoutConstraint.activate([
            feedbackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedbackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedbackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedbackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - FeedbackViewDelegate
extension FeedbackViewController: FeedbackViewDelegate {
    func didTabFeedbackButton() {
        // TODO: Add func
    }
}
