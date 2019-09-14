//
//  ZomatoAPI.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import Foundation
import Moya

public enum ZomatoAPI {
    case searchRestaurants(locationId: Int, locationType: String, cuisineId: Int)
}

extension ZomatoAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: Constants.ZomatoAPI.endpoint)!
    }
    
    public var path: String {
        switch self {
        case .searchRestaurants:
            return "/search"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .searchRestaurants:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .searchRestaurants(let locationId, let locationType, let cuisineId):
            return .requestParameters(parameters: [Constants.Parameters.locationId: locationId,
                                                   Constants.Parameters.locationType: locationType,
                                                   Constants.Parameters.cuisines: cuisineId],
                                      encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [Constants.Parameters.userKey: Constants.ZomatoAPI.userKey]
    }
    
}
