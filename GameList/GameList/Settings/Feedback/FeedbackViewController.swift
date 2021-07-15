//
//  FeedbackViewController.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//

import UIKit

class FeedbackViewController: UIViewController {

    var feedbackField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Место для вашего отзыва"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .never
        textField.contentVerticalAlignment = .top
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    var feedbackButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(feedbackField)
        view.addSubview(feedbackButton)
        setConstraint()
        feedbackField.delegate = self
        view.backgroundColor = .white
    }

    func setConstraint() {
        NSLayoutConstraint.activate([

            feedbackField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            feedbackField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            feedbackField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            feedbackField.heightAnchor.constraint(equalToConstant: 200),

            feedbackButton.widthAnchor.constraint(equalTo: feedbackField.widthAnchor),
            feedbackButton.heightAnchor.constraint(equalToConstant: 40),
            feedbackButton.topAnchor.constraint(equalTo: feedbackField.bottomAnchor, constant: 20),
            feedbackButton.centerXAnchor.constraint(equalTo: feedbackField.centerXAnchor)

        ])
    }
}

// MARK: - UITextFieldDelegate methods

extension FeedbackViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status.
        // NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window)
        // or endEditing:YES called
        print("TextField did end editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // if implemented, called in place of textFieldDidEndEditing:
        print("TextField did end editing with reason method called")
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        // may be useful: textField.resignFirstResponder()
        return true
    }
}
