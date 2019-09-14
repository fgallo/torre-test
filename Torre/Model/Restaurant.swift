//
//  Restaurant.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct Restaurant: Decodable {
    
    let id: String
    let name: String
    let priceRange: Int
    let location: Location
    let rate: Rate
    let photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case priceRange = "price_range"
        case location
        case rate = "user_rating"
        case photos
    }
    
    enum RestaurantKey: CodingKey {
        case restaurant
    }
    
    enum PhotoKey: CodingKey {
        case photos
    }
    
    init(from decoder: Decoder) throws {
        let rootKeys = try decoder.container(keyedBy: RestaurantKey.self)
        let restaurantContainer = try rootKeys.nestedContainer(keyedBy: CodingKeys.self,
                                                           forKey: .restaurant)
        try id =  restaurantContainer.decode(String.self, forKey: .id)
        try name =  restaurantContainer.decode(String.self, forKey: .name)
        try priceRange = restaurantContainer.decode(Int.self, forKey: .priceRange)
        try location = restaurantContainer.decode(Location.self, forKey: .location)
        try rate = restaurantContainer.decode(Rate.self, forKey: .rate)
        
        do {
            var photos = try restaurantContainer.nestedUnkeyedContainer(forKey: .photos)
            var allPhotos = [Photo]()
            
            while !photos.isAtEnd {
                let photo = try photos.decode(Photo.self)
                allPhotos.append(photo)
            }
            self.photos = allPhotos
        } catch {
            self.photos = []
        }
    }
    
}
