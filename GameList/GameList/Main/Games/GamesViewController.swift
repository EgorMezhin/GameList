//
//  GamesViewController.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class GamesViewController: UIViewController {
    private lazy var networkManager = NetworkManager()
    private lazy var games: Games = []
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
//        fetchGames()
    }


    private func removeData() {
        guard games.isEmpty else {
            return
        }
//        searchTableView.beginUpdates()
//        searchTableView.deleteSections(IndexSet(integer: 0), with: .fade)
//        searchTableView.endUpdates()
        gamesTableView.reloadData()
    }

    private func updateData() {
//        searchTableView.beginUpdates()
//        searchTableView.insertSections(IndexSet(integer: 0), with: .fade)
//        searchTableView.endUpdates()
        gamesTableView.reloadData()
    }

//    private func fetchGames() {
//        let request = GameByRatingRequest()
//        networkManager
//            .fetch(request: request,
//                   completion: { [weak self] (result: Result<GamesResponseBody>) in
//                    DispatchQueue.main.async {
//                        guard let self = self else { return }
//                        switch result {
//                        case .success(let body):
//                            self.removeData()
//                            self.games = body.games ?? []
//                            self.updateData()
//
//                        case .failure(let error):
//                            print(error)
//                        }
//                    }
//                   })
//    }
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
        games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(DetailedGameCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
//        cell.gameNameLabel.text = games[indexPath.row].name
//        cell.gameGenreLabel.text = games[indexPath.row].genres?.name
 //       cell.dateLabel.text = games[indexPath.row].firstReleaseDate
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
