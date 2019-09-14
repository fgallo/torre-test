//
//  RestaurantResponse.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct RestaurantResponse {
    let restaurants: [Restaurant]
    let totalRestaurants: Int
}

extension RestaurantResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case restaurants
        case totalRestaurants = "results_found"
    }
}
