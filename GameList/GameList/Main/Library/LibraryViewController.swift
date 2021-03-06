//
//  LibraryViewController.swift
//  GameList
//
//  Created by Egor Lass on 21.07.2021.
//

import UIKit

class LibraryViewController: UIViewController {
    private lazy var libraryTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = AppColor.blue
        tableView.registerCell(from: LibraryGameCell.self)
        tableView.rowHeight = Constants.cellHeight
        return tableView
    }()

    // MARK: - LibraryViewController lifecycle methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        libraryTableView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = AppColor.lightBlue
        view.addSubview(libraryTableView)
    }
}

// MARK: - UITableViewDelegate
extension LibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showGameVC()
    }
}

// MARK: - UITableViewDataSource
extension LibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(LibraryGameCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK: - Cell methods
extension LibraryViewController {
    private func showGameVC() {
        let gameViewController = GameViewController()
        navigationController?.pushViewController(
            gameViewController,
            animated: true
        )
    }
}
