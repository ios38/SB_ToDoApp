//
//  Location.swift
//  SB_ToDoApp
//
//  Created by Maksim Romanov on 12.08.2021.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard rhs.coordinate?.latitude == lhs.coordinate?.latitude &&
                lhs.coordinate?.longitude == rhs.coordinate?.longitude &&
                lhs.name == rhs.name else { return false }
        return true
    }
}
