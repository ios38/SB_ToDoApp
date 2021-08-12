//
//  TaskTests.swift
//  SB_ToDoAppTests
//
//  Created by Maksim Romanov on 12.08.2021.
//

import XCTest
@testable import SB_ToDoApp

class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task)
    }

    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertNotNil(task)
    }

    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertEqual(task.title, "Foo")
    }

    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertTrue(task.description == "Bar")
    }
    
    func testTaskInitsWithDate() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task.date)
    }

}
