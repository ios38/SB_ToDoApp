//
//  LocationTests.swift
//  SB_ToDoAppTests
//
//  Created by Maksim Romanov on 12.08.2021.
//

import XCTest
import CoreLocation
@testable import SB_ToDoApp

class LocationTests: XCTestCase {

    func testInitSetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }

    func testInitSetsCoordinates() {
        let coordinate = CLLocationCoordinate2D(
            latitude: 1,
            longitude: 2
        )
        let location = Location(name: "Foo",
                                coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }

}
