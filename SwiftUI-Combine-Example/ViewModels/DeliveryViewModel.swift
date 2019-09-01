//
//  DeliveryViewModel.swift
//  SwiftUI-Combine-Example
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import SwiftUI
import Combine

enum RemoteImageState {
    case error(_ error: Error)
    case image(_ image: UIImage)
    case loading
}

final class DeliveryViewModel: ObservableObject {
    @Published private(set) var deliveries = [Delivery]()

    @Published private(set) var userImages = [Delivery: UIImage]()

    @Published private var cancellable: Cancellable?
    
    static let cache = NSCache<NSURL, UIImage>()
    
    var state: RemoteImageState = .loading {
        didSet {
            objectWillChange.send()
        }
    }
    
    func fetch() {
        let urlComponents = URLComponents(string: "https://mock-api-mobile.dev.lalamove.com/deliveries")!

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let assign = Subscribers.Assign(object: self, keyPath: \.deliveries)
        cancellable = assign

        URLSession.shared.send(request: request)
            .decode(type: [Delivery].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .receive(subscriber: assign)
    }

    func getImage(for delivery: Delivery) {
        guard case .none = userImages[delivery] else {
            return
        }

        if let image = DeliveryViewModel.cache.object(forKey: delivery.imageUrl as NSURL) {
            state = .image(image)
            return
        }
        
        let request = URLRequest(url: delivery.imageUrl)
        URLSession.shared.send(request: request)
            .map { UIImage(data: $0) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .receive(subscriber: Subscribers.Sink<UIImage?, Never>(receiveCompletion: {_ in}) { [weak self] image in
                if let image = image {
                    DeliveryViewModel.cache.setObject(image, forKey: delivery.imageUrl as NSURL)
                    self?.state = .image(image)
                    self?.userImages[delivery] = image
                   }
            })
    }
}
