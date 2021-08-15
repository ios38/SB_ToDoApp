//
//  DataProvider.swift
//  SB_ToDoApp
//
//  Created by Maksim Romanov on 14.08.2021.
//

import UIKit

class DataProvider: NSObject {
    var taskManager: TaskManager?    
}

extension DataProvider: UITableViewDelegate {
    
}

extension DataProvider: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return taskManager?.tasksCount ?? 0
        case 1:
            return taskManager?.doneTasksCount ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
