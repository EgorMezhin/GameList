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
    private lazy var releaseDates: [ReleaseDate] = []
    private lazy var gamesTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorColor = AppColor.blue
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(from: DetailedGameCell.self)
        return tableView
    }()
    private lazy var loadingView: LoadView = {
        let loadView = LoadView()
        return loadView
    }()

    private var isLoading = false {
        didSet {
            loadingView.setLoading(isLoading)
        }
    }

    // MARK: - GamesViewController lifecycle methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gamesTableView.frame = view.bounds

        loadingView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = AppColor.lightBlue
        view.addSubview(gamesTableView)
        view.addSubview(loadingView)
        fetchGames()
    }

    private func fetchGames() {
        let request = GameByRatingBodyRequest()
        self.isLoading = true
        networkManager
            .fetch(request: request,
                   completion: { [weak self] (result: Result<GamesResponseBody>) in
                    DispatchQueue.main.async {
                        guard let self = self else { return }
                        self.isLoading = false
                        switch result {
                        case .success(let body):
                            self.removeData()
                            self.games = body.games ?? []
                            self.updateData()
                        case .failure(let error):
                            print(error)
                        }
                    }
                   })
    }

    private func removeData() {
        guard games.isEmpty else {
            return
        }
        gamesTableView.reloadData()
    }

    private func updateData() {
            self.gamesTableView.reloadData()
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
        games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(DetailedGameCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        if let cover = games[indexPath.row].cover {
         //   let coverString = cover.url
                let fullCoverString = "https:" + cover.url
                if let coverUrl = URL(string: fullCoverString) {
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: coverUrl)
                        if let unwrappedData = data {
                            DispatchQueue.main.async {
                                if let unwrappedGenreArray = self.games[indexPath.row].genres,
                                   let unwrappedDateArray = self.games[indexPath.row].releaseDates {
                                    cell.configureCell(
                                        title: self.games[indexPath.row].name,
                                        image: UIImage(data: unwrappedData),
                                        genres: unwrappedGenreArray[0].name,
                                        releaseDate: unwrappedDateArray[0].human)
                                }

                            }
                        }
                    }
                }
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
