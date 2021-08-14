//
//  ViewController.swift
//  SB_ToDoApp
//
//  Created by Maksim Romanov on 12.08.2021.
//

import UIKit

class TaskListViewController: UIViewController {
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        view.addSubview(tableView)
    }

}

