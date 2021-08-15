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
    
    func testNumberOfRowsInSectionZeroIsTaskCount() {
        sut.taskManager = TaskManager()
        sut.taskManager?.add(task: Task(title: "Foo"))

        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)

        sut.taskManager?.add(task: Task(title: "Bar"))
        tableView.reloadData()

        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

}
