//
//  DeliveryLocation.swift
//  SwiftUI - MVVM
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Foundation
import SwiftUI

struct DeliveryLocation: Hashable, Decodable, Equatable {
    static func ==(lhs: DeliveryLocation, rhs: DeliveryLocation) -> Bool {
        lhs.id == rhs.id
    }
    let id = UUID().uuidString
    var lat: Double
    var lng: Double
    var address: String
}
