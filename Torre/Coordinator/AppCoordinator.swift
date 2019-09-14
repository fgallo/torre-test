//
//  AppCoordinator.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    let restaurantsCoordinator: RestaurantsCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.barStyle = .black
        restaurantsCoordinator = RestaurantsCoordinator(presenter: rootViewController)
        setupAppearance()
    }
    
    func start() {
        window.rootViewController = rootViewController
        restaurantsCoordinator.start()
        window.makeKeyAndVisible()
    }
    
    private func setupAppearance() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = .white
        navigationBarAppearance.barTintColor = UIColor.TorreColor.Orange
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBarAppearance.isTranslucent = true
    }
}
