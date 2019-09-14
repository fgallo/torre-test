//
//  RestaurantDetailsViewController.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class RestaurantDetailsViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var priceRangeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var viewModel: RestaurantDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRestaurantFields()
        setupMap()
    }
    
    private func setupRestaurantFields() {
        nameLabel.text = viewModel.restaurantName()
        rateLabel.text = viewModel.restaurantRate()
        rateLabel.textColor = UIColor(hex: viewModel.restaurantRateHexColor())
        votesLabel.text = " • " + viewModel.restaurantVotes()
        priceRangeLabel.text = viewModel.restaurantFormatedPriceRange()
        addressLabel.text = viewModel.restaurantAddress()
        
        if let url = viewModel.restaurantCoverURL() {
            let processor = OverlayImageProcessor(overlay: .black,
                                                  fraction: 0.60)
            coverImageView.kf.indicatorType = .activity
            coverImageView.kf.setImage(
                with: url,
                options: [
                    .transition(.fade(1)),
                    .processor(processor),
                    .cacheOriginalImage
                ])
        } else {
            coverImageView.image = UIImage(named: "placeholder")
        }
    }
    
    private func setupMap() {
        if let latitude = viewModel.restaurantLatitude(), let longitude = viewModel.restaurantLongitude() {
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = self.viewModel.restaurantName()
            self.mapView.addAnnotation(annotation)
            self.mapView.showAnnotations([annotation], animated: false)
            self.mapView.isUserInteractionEnabled = false
        }
    }

}
