//
//  SceneDelegate.swift
//  SwiftUI - MVVM
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(
            rootView: DeliveryView().environmentObject(DeliveryViewModel())
        )
        self.window = window
        window.makeKeyAndVisible()
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: DeliveryView().environmentObject(DeliveryViewModel()))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
