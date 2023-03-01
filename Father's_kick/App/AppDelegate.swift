//
//  AppDelegate.swift
//  Father's_kick
//
//  Created by Alex on 01.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = ViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }
}

