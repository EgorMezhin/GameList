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

    // MARK: - SearchViewController lifecycle methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTableView.frame = view.bounds
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
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(SimpleGameCell.self, indexPath: indexPath) else {
            return UITableViewCell()
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
            didTapSearchButtonClicked(withText: serched)
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

    private func didTapSearchButtonClicked(withText text: String) {
        networkManager.getGames(body: GameSearchBody(text: text).body,
                                completion: { (response, error) in
                                    print(response)
                                })
    }
}
