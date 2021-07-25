//
//  SearchViewController.swift
//  GameList
//
//  Created by Egor Lass on 21.07.2021.
//

import UIKit

// TODO: Разобраться с searchView
class SearchViewController: UIViewController {
    private lazy var networkManager = NetworkManager()
    private lazy var games: Games = []
    private lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(from: SimpleGameCell.self)
        tableView.rowHeight = Constants.cellHeight
        return tableView
    }()
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 15, y: 100, width: 350, height: 50))
    //    searchBar.showsCancelButton = true
        searchBar.delegate = self
        searchBar.placeholder = Constants.searchPlaceholder
        definesPresentationContext = true
        return searchBar
    }()
    private lazy var loadView: LoadView = {
        let loadView = LoadView()
        return loadView
    }()

    // MARK: - SearchViewController lifecycle methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTableView.frame = view.bounds
        loadView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchTableView)
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
        cell.configureCell(title: games[indexPath.row].name, image: nil)
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
    // TODO: Крутой метод скрытия кнопки Cancel 
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
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

    private func setLoading(_ isLoading: Bool) {

    }

    private func removeData() {
        guard games.isEmpty else {
            return
        }
//        searchTableView.beginUpdates()
//        searchTableView.deleteSections(IndexSet(integer: 0), with: .fade)
//        searchTableView.endUpdates()
        searchTableView.reloadData()
    }

    private func updateData() {
//        searchTableView.beginUpdates()
//        searchTableView.insertSections(IndexSet(integer: 0), with: .fade)
//        searchTableView.endUpdates()
        searchTableView.reloadData()
    }

    private func fetchGames(withText text: String) {
        let request = GameSearchBodyRequest(text: text)
        networkManager
            .fetch(request: request,
                   completion: { [weak self] (result: Result<GamesResponseBody>) in
                    DispatchQueue.main.async {
                        guard let self = self else { return }
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
}
