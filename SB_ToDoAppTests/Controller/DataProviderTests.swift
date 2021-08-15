//
//  DataProviderTests.swift
//  SB_ToDoAppTests
//
//  Created by Maksim Romanov on 14.08.2021.
//

import XCTest
@testable import SB_ToDoApp

class DataProviderTests: XCTestCase {
    var sut: DataProvider!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        sut = DataProvider()
        sut.taskManager = TaskManager()
        tableView = UITableView()
        tableView.dataSource = sut
    }
    
    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
    }
    
    func testNumberOfSectionsIsTwo() {
        let numberOfSections = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfRowsInSectionZeroIsTasksCount() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)

        sut.taskManager?.add(task: Task(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

    func testNumberOfRowsInSectionOneIsDoneTasksCount() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        sut.taskManager?.checkTask(at: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)

        sut.taskManager?.add(task: Task(title: "Bar"))
        sut.taskManager?.checkTask(at: 0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }

}
