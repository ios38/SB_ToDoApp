//
//  ViewController.swift
//  SB_ToDoApp
//
//  Created by Maksim Romanov on 12.08.2021.
//

import UIKit

class TaskListViewController: UIViewController {
    var tableView = UITableView()
    var dataProvider = DataProvider()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        view.addSubview(tableView)
    }

}

