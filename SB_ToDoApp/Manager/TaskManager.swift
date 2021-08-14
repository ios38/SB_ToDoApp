//
//  TaskManager.swift
//  SB_ToDoApp
//
//  Created by Maksim Romanov on 13.08.2021.
//

import Foundation

class TaskManager {
    private var tasks = [Task]()
    private var doneTasks = [Task]()

    var tasksCount: Int {
        return tasks.count
    }
    
    var doneTasksCount: Int {
        return doneTasks.count
    }

    func add(task: Task) {
        tasks.append(task)
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }
    
    func checkTask(at index: Int) {
        let task = tasks.remove(at: index)
        doneTasks.append(task)
    }

    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
}
