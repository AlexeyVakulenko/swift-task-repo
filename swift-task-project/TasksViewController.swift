//
//  TasksViewController.swift
//  swift-task-project
//
//  Created by Aleksey Vakulenko on 17/11/2019.
//  Copyright © 2019 Aleksey Vakulenko. All rights reserved.
//

import Foundation
import UIKit

class TasksViewController : UIViewController {
    
    let cellName: String = "TableViewCall"
    let data:[String] = [
    "Action Script",
    "C++/CLI",
    "C++",
    "ColdFusion",
    "D",
    "Delphi",
    "Dylan",
    "Eiffel",
    "Game Maker Language (GML)",
    "Groovy",
    "Haxe",
    "Io",
    "Java",
    "JavaScript",
    "MC#",
    "Object Pascal",
    "Objective-C",
    "Perl",
    "PHP",
    "Pike",
    "Python",
    "Ruby",
    "Self",
    "Simula",
    "Smalltalk",
    "Swift",
    "Vala",
    "Visual Basic",
    "Visual DataFlex",
    "Zonnon",
    "Ada",
    "Активный Оберон",
    "Компонентный Паскаль",
    "Модула-3",
    "Оберон-2",
    ]
    
    let tableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Задачи"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(self.tableView)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellName)
        self.tableView.dataSource = self
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
}

extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return self.data.count
        default:
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! TableViewCell
        cell.textLabel?.text = self.data[indexPath.row]
        return cell
    }
    
    
    
}

class TableViewCell: UITableViewCell{
    
}
