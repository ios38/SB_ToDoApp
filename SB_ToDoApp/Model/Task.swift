//
//  Task.swift
//  SB_ToDoApp
//
//  Created by Maksim Romanov on 12.08.2021.
//

import Foundation

struct Task {
    var title: String
    var description: String?
    private(set) var date: Date?

    init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
    }
}
