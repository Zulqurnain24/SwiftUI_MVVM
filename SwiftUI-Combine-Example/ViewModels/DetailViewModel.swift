//
//  DetailViewModel.swift
//  SwiftUI-Combine-Example
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class DetailViewModel: ObservableObject {
    let objectWillChange: AnyPublisher<DetailViewModel, Never>
    let objectWillChangeSubject = PassthroughSubject<DetailViewModel, Never>()
    
    let delivery: Delivery
    
    init(delivery: Delivery) {
        objectWillChange = objectWillChangeSubject.eraseToAnyPublisher()
        self.delivery = delivery
    }
}
