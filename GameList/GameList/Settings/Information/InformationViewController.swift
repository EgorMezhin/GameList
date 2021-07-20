//
//  InformationViewController.swift
//  GameList
//
//  Created by Egor Lass on 15.07.2021.
//

import UIKit

final class InformationViewController: UIViewController {
    
    private lazy var informationView: InformationView = {
       let view = InformationView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - InformationViewController Methods
extension InformationViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(informationView)
        
        NSLayoutConstraint.activate([
            informationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            informationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func setConstraints() {
    }
}

// MARK: - InformationViewDelegate
extension InformationViewController: InformationViewDelegate {
    func didTapGithubButton() {
        if let url = URL(string: "https://github.com/EgorMezhin") {
            UIApplication.shared.open(url)
        }
    }
    
    func didTapTelegramButton() {
        if let url = URL(string: "https://t.me/Egorlass") {
            UIApplication.shared.open(url)
        }
    }
}
