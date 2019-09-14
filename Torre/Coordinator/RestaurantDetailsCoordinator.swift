//
//  RestaurantDetailsCoordinator.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class RestaurantDetailsCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var restaurantDetailsViewController: RestaurantDetailsViewController?
    private let restaurant: Restaurant
    
    init(presenter: UINavigationController, restaurant: Restaurant) {
        self.restaurant = restaurant
        self.presenter = presenter
    }
    
    func start() {
        let restaurantDetailsViewController = UIStoryboard.main.restaurantDetailsViewController
        restaurantDetailsViewController.title = restaurant.name
        restaurantDetailsViewController.viewModel = RestaurantDetailsViewModel(restaurant: restaurant)
        
        presenter.pushViewController(restaurantDetailsViewController, animated: true)
        self.restaurantDetailsViewController = restaurantDetailsViewController
    }
    
}
