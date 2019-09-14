//
//  UIStoryboard.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    @nonobjc static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    var restaurantsViewController: RestaurantsViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier: "RestaurantsViewController") as? RestaurantsViewController else {
                fatalError("RestaurantsViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
    
    var restaurantDetailsViewController: RestaurantDetailsViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier: "RestaurantDetailsViewController") as? RestaurantDetailsViewController else {
                fatalError("RestaurantDetailsViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
    
}
