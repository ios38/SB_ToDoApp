//
//  TaskListViewControllerTests.swift
//  SB_ToDoAppTests
//
//  Created by Maksim Romanov on 14.08.2021.
//

import XCTest
@testable import SB_ToDoApp

class TaskListViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableViewNotNilWhenViewIsLoaded() {
        let sut = TaskListViewController()
        
        // _ = sut.view // дергаем viewDidLoad()
        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.tableView)
    }

}
