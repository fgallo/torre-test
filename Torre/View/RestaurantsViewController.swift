//
//  RestaurantsViewController.swift
//  Torre
//
//  Created by Fernando Gallo on 14/09/19.
//  Copyright © 2019 Fernando Gallo. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var viewModel: RestaurantsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getRestaurants()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - Setup
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: RestaurantTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: RestaurantTableViewCell.cellIdentifier)
    }
    
    
    // MARK: - API
    
    private func getRestaurants() {
        activityIndicatorView.startAnimating()
        viewModel.fetchRestaurants()
    }

}


// MARK: - UITableView DataSource

extension RestaurantsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRestaurants()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.cellIdentifier,
                                                 for: indexPath) as! RestaurantTableViewCell
        
        cell.viewModel = viewModel.viewModelForItemAt(indexPath: indexPath)
        cell.configure()
        
        return cell
    }
    
}


// MARK: - UITableView Delegate

extension RestaurantsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showRestaurantDetailsAt(indexPath: indexPath)
    }
    
}


// MARK: - FetchRestaurantsDelegate

extension RestaurantsViewController: FetchRestaurantsDelegate {
    
    func fetchRestaurantsSuccess() {
        activityIndicatorView.stopAnimating()
        tableView.reloadData()
    }
    
    func fetchRestaurantsFailure() {
        activityIndicatorView.stopAnimating()
    }
    
}
