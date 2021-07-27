//
//  SearchViewController.swift
//  GameList
//
//  Created by Egor Lass on 21.07.2021.
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var networkManager = NetworkManager()
    private lazy var games: Games = []
    private lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = AppColor.blue
        tableView.registerCell(from: SimpleGameCell.self)
        tableView.rowHeight = Constants.cellHeight
        return tableView
    }()
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 15, y: 100, width: 350, height: 50))
        searchBar.delegate = self
        searchBar.placeholder = Constants.searchPlaceholder
        searchBar.compatibleSearchTextField.backgroundColor = AppColor.lightBlue
        definesPresentationContext = true
        return searchBar
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

    // MARK: - SearchViewController lifecycle methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTableView.frame = view.bounds
        loadingView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = AppColor.lightBlue
        view.addSubview(searchTableView)
        view.addSubview(loadingView)
        searchTableView.tableHeaderView = searchBar
    }
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showGameVC()
    }
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(SimpleGameCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
         let coverString = games[indexPath.row].cover.url 
            let fullCoverString = "https:" + coverString
            if let coverUrl = URL(string: fullCoverString) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: coverUrl)
                    if let unwrappedData = data {
                        DispatchQueue.main.async {
                            cell.configureCell(title: self.games[indexPath.row].name,
                                               image: UIImage(data: unwrappedData))
                        }
                    }
                }
            }

        return cell
    }
}

// MARK: - UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO:
  }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard !isLoading else { return false }
        guard let currentText = searchBar.text,
              let range = Range(range, in: currentText) else {
            return false
        }
        let newText = currentText.replacingCharacters(in: range, with: text)
        searchBar.setShowsCancelButton(!newText.isEmpty, animated: true)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let currentText = searchBar.text else { return }
        let serched = currentText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !serched.isEmpty {
            fetchGames(withText: serched)
        }
    }
}

// MARK: - Cell methods
extension SearchViewController {
    private func showGameVC() {
        let gameViewController = GameViewController()
        navigationController?.pushViewController(
            gameViewController,
            animated: true
        )
    }

    private func updateData() {
        searchTableView.beginUpdates()
        searchTableView.reloadSections(IndexSet(integer: 0), with: .fade)
        searchTableView.endUpdates()
    }

    private func fetchGames(withText text: String) {
        let request = GameSearchBodyRequest(text: text)
        self.isLoading = true
        networkManager
            .fetch(request: request,
                   completion: { [weak self] (result: Result<GamesResponseBody>) in
                    DispatchQueue.main.async {
                        guard let self = self else { return }
                     //   self.isLoading = false
                        switch result {
                        case .success(let body):
                            self.games = body.games ?? []
                            self.updateData()
                        case .failure(let error):
                            print(error)
                        }
                    }
                   })
    }
}
