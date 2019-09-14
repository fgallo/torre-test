//
//  RestaurantDetailsViewModel.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

class RestaurantDetailsViewModel {
    
    private let restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    func restaurantName() -> String {
        return restaurant.name
    }
    
    func restaurantRate() -> String {
        return restaurant.rate.value
    }
    
    func restaurantRateHexColor() -> Int {
        if let color = Int(restaurant.rate.hexColor, radix: 16) {
            return color
        }
        
        return 0x000000
    }
    
    func restaurantFormatedPriceRange() -> String {
        var formatedPriceRange = ""
        for _ in 0..<restaurant.priceRange {
            formatedPriceRange.append("$")
        }
        
        return formatedPriceRange
    }
    
    func restaurantVotes() -> String {
        return "\(restaurant.rate.votes) Reviews"
    }
    
    func restaurantAddress() -> String {
        return restaurant.location.address
    }
    
    func restaurantCoverURL() -> URL? {
        return URL(string: restaurant.coverImage)
    }
    
    func restaurantLatitude() -> Double? {
        return Double(restaurant.location.latitude)
    }
    
    func restaurantLongitude() -> Double? {
        return Double(restaurant.location.longitude)
    }
    
}
