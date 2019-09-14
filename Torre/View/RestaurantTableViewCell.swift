//
//  RestaurantTableViewCell.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var priceRangeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    static let cellIdentifier = "RestaurantCell"
    
    var viewModel: RestaurantCellViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        [firstImageView, secondImageView, thirdImageView].forEach { imageView in
            imageView?.layer.cornerRadius = 4.0
        }
    }

    func configure() {
        nameLabel.text = viewModel.name
        rateLabel.text = viewModel.rate
        rateLabel.textColor = UIColor(hex: viewModel.rateHexColor)
        votesLabel.text = " • " + viewModel.votes
        priceRangeLabel.text = viewModel.priceRange
        addressLabel.text = viewModel.address
        setup(imageView: firstImageView, url: viewModel.firstImageURL)
        setup(imageView: secondImageView, url: viewModel.secondImageURL)
        setup(imageView: thirdImageView, url: viewModel.thirdImageURL)
    }
    
    private func setup(imageView: UIImageView, url: URL?) {
        if let url = url {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(
                with: url,
                options: [
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        } else {
            imageView.image = nil
        }
    }
    
}
