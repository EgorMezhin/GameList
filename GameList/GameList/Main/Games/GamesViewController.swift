//
//  GamesViewController.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class GamesViewController: UIViewController {
    private lazy var gamesTableView: UITableView = {
        let tableView = UITableView()
     //   tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(from: DetailedGameCell.self)
        return tableView
    }()

    // MARK: - GamesViewController lifecycle methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gamesTableView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gamesTableView)
    }
}

// MARK: - UITableViewDelegate
extension GamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showGameVC()
    }
}

// MARK: - UITableViewDataSource
extension GamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO:
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(DetailedGameCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK: - Cell methods
extension GamesViewController {
    private func showGameVC() {
        let gameViewController = GameViewController()
        navigationController?.pushViewController(
            gameViewController,
            animated: true
        )
    }
}
