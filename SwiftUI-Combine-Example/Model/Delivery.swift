//
//  Delivery.swift
//  SwiftUI - MVVM
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import SwiftUI

struct : Hashable, Identifiable, Decodable {
    var id: Int64
    var description: String
    var imageUrl: URL
    var location: DeliveryLocation
}
