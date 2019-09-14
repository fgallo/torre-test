//
//  Rating.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct Rate {
    let value: String
    let votes: String
    let hexColor: String
}

extension Rate: Decodable {
    enum CodingKeys: String, CodingKey {
        case value = "aggregate_rating"
        case votes
        case hexColor = "rating_color"
    }
}
