//
//  TaskListViewControllerTests.swift
//  SB_ToDoAppTests
//
//  Created by Maksim Romanov on 14.08.2021.
//

import XCTest
@testable import SB_ToDoApp

class TaskListViewControllerTests: XCTestCase {
    var sut: TaskListViewController!

    override func setUpWithError() throws {
        sut = TaskListViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testTableViewNotNilWhenViewIsLoaded() {
        let sut = TaskListViewController()

        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedDataProviderIsNotNil() {
        XCTAssertNotNil(sut.dataProvider)
    }

    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateEqualsTableViewDataSource() {
        XCTAssertEqual(
            sut.tableView.delegate as? DataProvider,
            sut.tableView.dataSource as? DataProvider
        )
    }

}
