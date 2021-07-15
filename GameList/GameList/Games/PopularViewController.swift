//
//  PopularViewController.swift
//  GameList
//
//  Created by Egor Lass on 06.07.2021.
//


import UIKit

class PopularViewController: UIViewController {

    var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTableView = UITableView(frame: CGRect(
                                            x: 0,
                                            y: 0,
                                            width: view.frame.width,
                                            height: view.frame.height)
        )
        
        settingsTableView.register(NewGameCell.self, forCellReuseIdentifier: "GamesCell")
        settingsTableView.dataSource = self
        settingsTableView.delegate = self

        view.addSubview(settingsTableView)
    }
    
    // MARK:  - Cell methods
    
    func testFunc() {
        print("Оформляем")
    }

    func testFunc2() {
        print("Обратную связь нажали")
    }
    
}

// MARK:  - UITableViewDelegate methods

extension PopularViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //Force unwrap!!!!
//        //!!!!!
//        //!!!!!
//        cellArray[indexPath.row].selectionBlock!()
//    }
}

// MARK:  - UITableViewDataSource methods

extension PopularViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GamesCell", for: indexPath) as! NewGameCell

//        cell.label.text = cellArray[indexPath.row].text
//        cell.selectionStyle = .none
        return cell
    }
}
