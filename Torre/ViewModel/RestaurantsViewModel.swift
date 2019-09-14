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

class RestaurantsViewModel {
    
    private let provider: MoyaProvider<ZomatoAPI>
    private var restaurants: [Restaurant]
    
    weak var fetchDelegate: FetchRestaurantsDelegate?
    
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
    
}
