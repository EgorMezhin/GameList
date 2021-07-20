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
            image: UIImage(systemName: SystemImage.person.rawValue),
            style: .plain,
            target: self,
            action: #selector(showUserInfoVC(sender:))
        )
        return barButtonItem
    }()
    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        // TODO: change other cells register func
        tableView.registerCell(from: SettingsCell.self)
        return tableView
    }()
    private lazy var settings: [SettingModel] = [
        SettingModel(
            text: CellTitle.developerInfo.rawValue,
            image: nil,
            selectionBlock: showInformationVC
        ),
        SettingModel(
            text: CellTitle.feedback.rawValue,
            image: nil,
            selectionBlock: showFeedbackVC
        ),
        SettingModel(
            text: CellTitle.apiInfo.rawValue,
            image: UIImage(named: SystemImage.link.rawValue),
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settings[indexPath.row].selectionBlock?()
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: init other cells
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
        // TODO: Create global struct or enum for urls
        if let url = URL(string: "https://www.igdb.com/api") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - UIBarButtonItem Methods
extension SettingsViewController {
    @objc func showUserInfoVC(sender: UIBarButtonItem) {
        // TODO: Add functionality
    }
}
