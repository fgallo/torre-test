//
//  RestaurantCellViewModel.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct RestaurantCellViewModel {
    
    let name: String
    let rate: String
    let rateHexColor: Int
    let votes: String
    let priceRange: String
    let address: String
    let firstImageURL: URL?
    let secondImageURL: URL?
    let thirdImageURL: URL?
    
    init(restaurant: Restaurant) {
        self.name = restaurant.name
        self.rate = restaurant.rate.value
        self.votes = "\(restaurant.rate.votes) Reviews"
        self.address = restaurant.location.address
        
        if let color = Int(restaurant.rate.hexColor, radix: 16) {
            self.rateHexColor = color
        } else {
            self.rateHexColor = 0x000000
        }
        
        var formatedPriceRange = ""
        for _ in 0..<restaurant.priceRange {
            formatedPriceRange.append("$")
        }
        self.priceRange = formatedPriceRange
        
        self.firstImageURL = restaurant.photos.count > 0 ? URL(string: restaurant.photos[0].url) : nil
        self.secondImageURL = restaurant.photos.count > 1 ? URL(string: restaurant.photos[1].url) : nil
        self.thirdImageURL = restaurant.photos.count > 2 ? URL(string: restaurant.photos[2].url) : nil
    }
    
}
