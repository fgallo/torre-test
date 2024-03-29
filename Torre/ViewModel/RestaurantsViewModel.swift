//
//  RestaurantsViewModel.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Moya

protocol FetchRestaurantsDelegate: class {
    func fetchRestaurantsSuccess()
    func fetchRestaurantsFailure()
}

protocol RestaurantsNavigationDelegate: class {
    func restaurantSelected(_ restaurant: Restaurant)
}

class RestaurantsViewModel {
    
    private let provider: MoyaProvider<ZomatoAPI>
    private var restaurants: [Restaurant]
    
    weak var fetchDelegate: FetchRestaurantsDelegate?
    weak var navigationDelegate: RestaurantsNavigationDelegate?
    
    init(provider: MoyaProvider<ZomatoAPI>) {
        self.provider = provider
        self.restaurants = []
    }
    
    
    // MARK: - API
    
    func fetchRestaurants() {
        provider.request(ZomatoAPI.searchRestaurants(locationId: Constants.Cities.saoPaulo,
                                                     locationType: LocationType.city.rawValue,
                                                     cuisineId: Constants.Cuisines.japanese)) { result in
                                                        switch result {
                                                        case .failure:
                                                            self.fetchDelegate?.fetchRestaurantsFailure()
                                                        case .success(let response):
                                                            do {
                                                                let restaurantResponse = try JSONDecoder().decode(RestaurantResponse.self, from: response.data)
                                                                self.restaurants.append(contentsOf: restaurantResponse.restaurants)
                                                                DispatchQueue.main.async {
                                                                    self.fetchDelegate?.fetchRestaurantsSuccess()
                                                                }
                                                            } catch {
                                                                DispatchQueue.main.async {
                                                                    self.fetchDelegate?.fetchRestaurantsFailure()
                                                                }
                                                            }
                                                        }
        }
    }
    
    
    // MARK: - Helpers
    
    func numberOfRestaurants() -> Int {
        return restaurants.count
    }
    
    func viewModelForItemAt(indexPath: IndexPath) -> RestaurantCellViewModel {
        let restaurant = restaurants[indexPath.row]
        return RestaurantCellViewModel(restaurant: restaurant)
    }
    
    func showRestaurantDetailsAt(indexPath: IndexPath) {
        let restaurant = restaurants[indexPath.row]
        navigationDelegate?.restaurantSelected(restaurant)
    }
    
}
