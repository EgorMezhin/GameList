//
//  InformationViewController.swift
//  GameList
//
//  Created by Egor Lass on 15.07.2021.
//

import UIKit

class InformationViewController: UIViewController {
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Егор Межин"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var photoView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var githubLinkLabel: UILabel = {
        let label = UILabel()
        label.text = "Github"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var telegramLinkLabel: UILabel = {
        let label = UILabel()
        label.text = "Telegram"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addSubviews()
        setConstraint()
    }
    
    func addSubviews() {
        view.addSubview(nameLabel)
        view.addSubview(photoView)
        view.addSubview(githubLinkLabel)
        view.addSubview(telegramLinkLabel)
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([

            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    
}
