//
//  GamesViewController.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class GamesViewController: UIViewController {

    var settingsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTableView = UITableView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.frame.width,
                height: view.frame.height
            )
        )

        settingsTableView.register(DetailedGameCell.self, forCellReuseIdentifier: "DetailedGameCell")
        settingsTableView.dataSource = self
        settingsTableView.delegate = self

        view.addSubview(settingsTableView)
    }

    // MARK: - Cell methods

    func testFunc() {
        print("Оформляем")
    }

    func testFunc2() {
        print("Обратную связь нажали")
    }

}

// MARK: - UITableViewDelegate methods

extension GamesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //Force unwrap!!!!
//        //!!!!!
//        //!!!!!
//        cellArray[indexPath.row].selectionBlock!()
//    }
}

// MARK: - UITableViewDataSource methods

extension GamesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailedGameCell", for: indexPath) as? DetailedGameCell
        guard let unwrappedCell = cell else {fatalError()}
//        cell.label.text = cellArray[indexPath.row].text
//        cell.selectionStyle = .none
        return unwrappedCell
    }
}
