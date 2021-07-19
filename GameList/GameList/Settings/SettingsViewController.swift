//
//  SettingsTableViewController.swift
//  GameList
//
//  Created by Egor Lass on 05.07.2021.
//

import UIKit

final class SettingsViewController: UIViewController {

    private lazy var feedbackViewController = FeedbackViewController()
    private lazy var informationViewController = InformationViewController()
    private lazy var userInfo: UIBarButtonItem = {
       var barButtonItem = UIBarButtonItem(
        image: UIImage(systemName: BarButtonItemImage.person.rawValue),
        style: .plain,
        target: self,
        action: #selector(action(sender:))
    )
        return barButtonItem
    }()
    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            SettingsCell.self,
            forCellReuseIdentifier: CellIdentifier.settings.rawValue
        )
        return tableView
    }()
    private lazy var settings: [SettingModel] = [
        SettingModel(
            text: CellTitle.developerInfo.rawValue,
            image: UIImage(systemName: "arrow.right"),
            selectionBlock: showInformationVC
        ),
        SettingModel(
            text: CellTitle.feedback.rawValue,
            image: UIImage(systemName: "arrow.right"),
            selectionBlock: showFeedbackVC
        ),
        SettingModel(
            text: CellTitle.apiInfo.rawValue,
            image: UIImage(systemName: "link"),
            selectionBlock: showApiInfo
        )
    ]
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        settingsTableView.frame = view.bounds
        self.navigationItem.rightBarButtonItem = userInfo
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsTableView)
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 50
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
        //Check result later
    ) {
        settings[indexPath.row].selectionBlock?()
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return settings.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "SettingsCell",
                for: indexPath
        ) as? SettingsCell else { return UITableViewCell() }
        cell.configureCell(
            title: settings[indexPath.row].text,
            image: settings[indexPath.row].image
        )
        return cell
    }
}

// MARK: - Cell Methods
extension SettingsViewController {
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
    private func showApiInfo() {
        //Check url below
        if let url = URL(string: "https://www.igdb.com/api") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - UIBarButtonItem Methods
extension SettingsViewController {
    @objc func action(sender: UIBarButtonItem) {
        //Add functionality
    }
}

// MARK: - Variable Values
extension SettingsViewController {
    private struct SettingModel {
        var text: String
        var image: UIImage?
        var selectionBlock: (() -> Void)?
    }
    //Check enum below
    private enum BarButtonItemImage: String {
        case person = "person.fill"
    }
    private enum CellTitle: String {
            case appereance = "Оформление"
            case feedback = "Оставить отзыв"
            case developerInfo = "О разработчике"
            case apiInfo = "Подробнее про IGDB API"
            case logOut = "Выйти из учетной записи"
        }
    private enum CellIdentifier: String {
            case settings = "SettingsCell"
        }
}
