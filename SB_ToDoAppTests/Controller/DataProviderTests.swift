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
        tableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        tableView.dataSource = sut
        tableView.delegate  = sut
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

    func testCellForRowAtIndexPathReturnsTaskCell() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is TaskCell)
    }

    func testCellForRowAtIndexPathDequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)

        sut.taskManager?.add(task: Task(title: "Foo"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellIsDequeued)
    }

    func testCellForRowInSectionZeroCallsConfigure() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)

        let task = Task(title: "Foo")
        sut.taskManager?.add(task: task)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockTaskCell
        
        XCTAssertEqual(cell.task, task)
    }
    
    func testCellForRowInSectionOneCallsConfigure() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)

        let task = Task(title: "Foo")
        let task2 = Task(title: "Bar")
        sut.taskManager?.add(task: task)
        sut.taskManager?.add(task: task2)
        sut.taskManager?.checkTask(at: 0)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockTaskCell
        
        XCTAssertEqual(cell.task, task)
    }

    func testDeleteButtonTitleSectionZeroShowsDone() {
        let buttonTitle = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(buttonTitle, "Done")
    }

    func testDeleteButtonTitleSectionOneShowsUndone() {
        let buttonTitle = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(buttonTitle, "Undone")
    }

}

extension DataProviderTests {
    class MockTableView: UITableView {
        var cellIsDequeued = false
        
        static func mockTableView(withDataSource dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 375, height: 658), style: .plain)
            mockTableView.dataSource = dataSource
            mockTableView.register(MockTaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
            return mockTableView
        }

        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockTaskCell: TaskCell {
        var task: Task?
        
        override func configure(withTask task: Task) {
            self.task = task
        }
    }
}
