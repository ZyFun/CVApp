//
//  AppDelegate.swift
//  CVApp
//
//  Created by Дмитрий Данилин on 01.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        createAndShowStartVC()
        
        return true
    }
}

// MARK: - Initial application settings

private extension AppDelegate {
    /// Создание и отображение стартового ViewController
    func createAndShowStartVC() {
        let mainVC = CVViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        
        PresentationAssembly().cv.config(
            view: mainVC,
            navigationController: navigationController
        )

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

