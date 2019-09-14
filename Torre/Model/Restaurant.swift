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
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
    
    enum RestaurantKey: CodingKey {
        case restaurant
    }
    
    init(from decoder: Decoder) throws {
        let rootKeys        = try decoder.container(keyedBy: RestaurantKey.self)
        let restaurantContainer  = try rootKeys.nestedContainer(keyedBy: CodingKeys.self,
                                                           forKey: .restaurant)
        try id =  restaurantContainer.decode(String.self, forKey: .id)
        try name =  restaurantContainer.decode(String.self, forKey: .name)
    }
    
}
