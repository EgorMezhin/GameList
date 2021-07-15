//
//  SettingsTableViewController.swift
//  GameList
//
//  Created by Egor Lass on 05.07.2021.
//

import UIKit



class SettingsViewController: UIViewController {

    private struct Cell {
        var text: String
        var selectionBlock: (()->Void)?
    }
    
    lazy private var cellArray: [Cell] = [
        Cell(text: "Оформление", selectionBlock: setAppereance),
        Cell(text: "Оставить отзыв", selectionBlock: testFunc2),
        Cell(text: "Поделиться", selectionBlock: testFunc2),
        Cell(text: "Информация", selectionBlock: testFunc2),
        Cell(text: "Выйти из учетной записи", selectionBlock: testFunc),
    ]

    var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        settingsTableView = UITableView(frame: CGRect(
                                            x: 0,
                                            y: 0,
                                            width: view.frame.width,
                                            height: view.frame.height)
        )
        
        settingsTableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        settingsTableView.dataSource = self
        settingsTableView.delegate = self

        view.addSubview(settingsTableView)
    }
    
    // MARK:  - Cell methods
    
    func setAppereance() {
        
        let appereanceAlert = UIAlertController(
            title: "Выберите тему",
            message: nil,
            preferredStyle: .actionSheet
        )

        let firstAction = UIAlertAction(
            title: "Светлая",
            style: .default)
            { (action: UIAlertAction) -> Void in
            
            print("Светлая тема")
            
            }
        
        let secondAction = UIAlertAction(
            title: "Тёмная",
            style: .default)
            { (action: UIAlertAction) -> Void in
            
            print("Тёмная тема")
            
            }
        
        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .cancel
        )
        { action -> Void in
            
            print("Отмена")
            
        }
        
        appereanceAlert.addAction(firstAction)
        appereanceAlert.addAction(secondAction)
        appereanceAlert.addAction(cancelAction)
        
        present(appereanceAlert, animated: true)
    }
    
    
    
    
    func testFunc() {
        print("Оформляем")
    }

    func testFunc2() {
        print("Обратную связь нажали")
    }
    
}

// MARK:  - UITableViewDelegate methods

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Force unwrap!!!!
        //!!!!!
        //!!!!!
        cellArray[indexPath.row].selectionBlock!()
    }
}

// MARK:  - UITableViewDataSource methods

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
        cell.label.text = cellArray[indexPath.row].text
        cell.selectionStyle = .none
        return cell
    }
}

