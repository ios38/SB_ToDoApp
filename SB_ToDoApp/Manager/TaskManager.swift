//
//  TaskManager.swift
//  SB_ToDoApp
//
//  Created by Maksim Romanov on 13.08.2021.
//

import Foundation

class TaskManager {
    var tasksCount = 0
    let doneTasksCount = 0
    
    func add(task: Task) {
        tasksCount += 1
    }
    
    func task(at index: Int) -> Task {
        return Task(title: "")
    }
}
