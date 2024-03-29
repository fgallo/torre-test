//
//  Constants.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation

struct Constants {
    
    struct ZomatoAPI {
        static let endpoint = "https://developers.zomato.com/api/v2.1"
        static let userKey = "11e1971efb8840ab85d11769c32be9bf"
    }
    
    struct Parameters {
        static let userKey = "user-key"
        static let locationId = "entity_id"
        static let locationType = "entity_type"
        static let cuisines = "cuisines"
        static let sort = "sort"
        static let order = "order"
    }
    
    struct Cuisines {
        static let japanese = 60
    }
    
    struct Cities {
        static let saoPaulo = 67
    }
    
}
