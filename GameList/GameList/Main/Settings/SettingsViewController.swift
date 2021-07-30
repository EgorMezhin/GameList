//
//  SettingsTableViewController.swift
//  GameList
//
//  Created by Egor Lass on 05.07.2021.
//

import UIKit
import MessageUI

final class SettingsViewController: UIViewController {
    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorColor = AppColor.blue
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.registerCell(from: SettingsCell.self)
        return tableView
    }()
    private lazy var settings: [SettingModel] = [
        SettingModel(
            text: SettingCellTitle.developerInfo.rawValue,
            image: nil,
            selectionBlock: showInformationVC
        ),
        SettingModel(
            text: SettingCellTitle.feedback.rawValue,
            image: nil,
            selectionBlock: sendFeedback
        ),
        SettingModel(
            text: SettingCellTitle.apiInfo.rawValue,
            image: UIImage(named: SystemImage.link.rawValue),
            selectionBlock: showApiInfo
        )
    ]

    // MARK: - SettingsViewController lifecycle methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        settingsTableView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = AppColor.lightBlue
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
        view.addSubview(settingsTableView)
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settings[indexPath.row].selectionBlock?()
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(SettingsCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        cell.configureCell(
            title: settings[indexPath.row].text,
            image: settings[indexPath.row].image
        )
        return cell
    }
}

// MARK: - Cell methods
extension SettingsViewController {

    /// - note: Потенциальная доработка
    /// Вместо отправки сообщений telegarm-боту можно реализовать отправку сообщений на собсвенный бэкенд.
    /// UI готов (FeedbackViewController), для коррректной работы необходимо подключение Firebase Realtime Database
    private func sendFeedback() {
        if let url = URL(string: Constants.feedbackUrl) {
            UIApplication.shared.open(url)
        }
    }

    private func showInformationVC() {
        let informationViewController = InformationViewController()
        navigationController?.pushViewController(
            informationViewController,
            animated: true
        )
    }

    private func showApiInfo() {
        if let url = URL(string: Constants.apiUrl) {
            UIApplication.shared.open(url)
        }
    }
}
