//
//  SettingsTableViewController.swift
//  GameList
//
//  Created by Egor Lass on 05.07.2021.
//

import UIKit

final class SettingsViewController: UIViewController {

    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        return tableView
    }()
    
    private lazy var feedbackViewController = FeedbackViewController()
    private lazy var informationViewController = InformationViewController()

    //fileprivate вынести из контроллера
    private struct SettingModel {
        var text: String
        var selectionBlock: (() -> Void)?
    }
    
    private lazy var settings: [SettingModel] = [
        //Вынести в переменные localizable string
        //
        //
        SettingModel(text: "Оформление", selectionBlock: setAppereance),
        SettingModel(text: "Оставить отзыв", selectionBlock: showFeedbackVC),
        SettingModel(text: "Разработчик", selectionBlock: showInformationVC),
        SettingModel(text: "Выйти из учетной записи", selectionBlock: logOut)
    ]

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        settingsTableView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsTableView)
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settings[indexPath.row].selectionBlock?()
    }
}

// MARK: - UITableViewDataSource methods
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as? SettingsCell else { return UITableViewCell() }
        cell.configureCell(with: settings[indexPath.row].text)
        return cell
    }
}

// MARK: - Cell Methods
extension SettingsViewController {
    private func setAppereance() {

        let appereanceAlert = UIAlertController(
            title: "Выберите тему",
            message: nil,
            preferredStyle: .actionSheet
        )

        let firstAction = UIAlertAction(
            title: "Светлая",
            style: .default) { (_: UIAlertAction) in

            print("Светлая тема")

            }

        let secondAction = UIAlertAction(
            title: "Тёмная",
            style: .default) { (_: UIAlertAction) in

            print("Тёмная тема")

            }

        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .cancel
        ) { _ in

            print("Отмена")

        }

        appereanceAlert.addAction(firstAction)
        appereanceAlert.addAction(secondAction)
        appereanceAlert.addAction(cancelAction)

        present(appereanceAlert, animated: true)
    }

    private func showFeedbackVC() {
        navigationController?.pushViewController(
            feedbackViewController,
            animated: true
        )
    }

    private func showInformationVC() {
        navigationController?.pushViewController(
            informationViewController,
            animated: true
        )
    }

    private func logOut() {
    }
}
