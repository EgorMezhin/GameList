//
//  SearchViewController.swift
//  GameList
//
//  Created by Egor Lass on 21.07.2021.
//

import UIKit

// TODO: Разобраться с searchView
class SearchViewController: UIViewController {
    private lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(from: SimpleGameCell.self)
        tableView.rowHeight = Constants.cellHeight
        return tableView
    }()
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = Constants.searchPlaceholder
        searchController.searchBar.barTintColor = .white
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        return searchController
    }()

    // MARK: - SearchViewController lifecycle methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTableView.frame = view.bounds
        searchTableView.tableHeaderView = searchController.searchBar
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchTableView)
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

// MARK: - Cell methods
extension SearchViewController {
    private func showGameVC() {
        let gameViewController = GameViewController()
        navigationController?.pushViewController(
            gameViewController,
            animated: true
        )
    }
}
