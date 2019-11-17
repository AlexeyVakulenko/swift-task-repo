//
//  TasksViewController.swift
//  swift-task-project
//
//  Created by Aleksey Vakulenko on 17/11/2019.
//  Copyright © 2019 Aleksey Vakulenko. All rights reserved.
//

import Foundation
import UIKit

class NotesViewController : UIViewController {
    
    let cellName: String = "TableViewCall"
    var data:[String] =
//        [""]
    [
    "Action Script",
    "C++/CLI",
    "C++",
    "ColdFusion",
    "D",
    "Delphi",
    "Dylan",
    "Eiffel",
    "Game Maker Language (GML)",
//    "Groovy",
//    "Haxe",
//    "Io",
//    "Java",
//    "JavaScript",
//    "MC#",
//    "Object Pascal",
//    "Objective-C",
//    "Perl",
//    "PHP",
//    "Pike",
//    "Python",
//    "Ruby",
//    "Self",
//    "Simula",
//    "Smalltalk",
//    "Swift",
//    "Vala",
//    "Visual Basic",
//    "Visual DataFlex",
//    "Zonnon",
//    "Ada",
//    "Активный Оберон",
//    "Компонентный Паскаль",
//    "Модула-3",
//    "Оберон-2",
    ]
    
    let tableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.grouped)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Notes"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(self.tableView)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellName)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isScrollEnabled = true
        
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

extension NotesViewController: UITableViewDataSource {
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
        cell.textLabel?.text = self.data.reversed()[indexPath.row]
        return cell
    }
}

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click \(indexPath) Content \(data[indexPath.row])")
        addRow("sfsdfsdf", indexPath)
        
    }
    
    func addRow(_ note: String, _ indexPath: IndexPath) {
        tableView.beginUpdates()
        data.append("dfssdfdsf")
        tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.left)
        tableView.reloadData()
        tableView.endUpdates()
    }
}

class TableViewCell: UITableViewCell{
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
