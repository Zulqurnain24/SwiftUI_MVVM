//
//  AnySubscription.swift
//  SwiftUI - MVVM
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Combine

final class AnySubscription: Subscription {
    private let cancellable: Cancellable

    init(_ cancel: @escaping () -> Void) {
        cancellable = AnyCancellable(cancel)
    }

    func request(_ demand: Subscribers.Demand) {}

    func cancel() {
        cancellable.cancel()
    }
}
