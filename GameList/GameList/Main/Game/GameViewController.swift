//
//  GameViewController.swift
//  GameList
//
//  Created by Egor Lass on 21.07.2021.
//

import UIKit

final class GameViewController: UIViewController {
    private lazy var gameview: GameView = {
        let view = GameView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - GameViewController lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = AppColor.lightBlue
        setupView()
    }
}

// MARK: - GameViewController methods
extension GameViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(gameview)
        NSLayoutConstraint.activate([
            gameview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gameview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gameview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - GameViewDelegateDelegate
extension GameViewController: GameViewDelegate {
    func didTapAddButton() {
        // TODO:
    }
}
