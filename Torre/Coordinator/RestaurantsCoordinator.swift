//
//  RestaurantsCoordinator.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class RestaurantsCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var restaurantsViewController: RestaurantsViewController?
    private var restaurantDetailsCoordinator: RestaurantDetailsCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let restaurantsViewController = UIStoryboard.main.restaurantsViewController
        restaurantsViewController.title = "Best Japanese Restaurants"
        
        let restaurantsViewModel = RestaurantsViewModel(provider: ZomatoProvider)
        restaurantsViewController.viewModel = restaurantsViewModel
        restaurantsViewModel.fetchDelegate = restaurantsViewController
        restaurantsViewModel.navigationDelegate = self
        presenter.pushViewController(restaurantsViewController, animated: true)
        
        self.restaurantsViewController = restaurantsViewController
    }
    
}

extension RestaurantsCoordinator: RestaurantsNavigationDelegate {
    
    func restaurantSelected(_ restaurant: Restaurant) {
        let restaurantDetailsCoordinator = RestaurantDetailsCoordinator(presenter: presenter, restaurant: restaurant)
        restaurantDetailsCoordinator.start()
        
        self.restaurantDetailsCoordinator = restaurantDetailsCoordinator
    }
    
}
