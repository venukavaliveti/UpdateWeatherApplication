//
//  WeatherCoordinator.swift
//  WeatherApp
//
//  Created by Venuka Valiveti on 28/09/24.
//

import Foundation
import SwiftUI

class WeatherCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let weatherService = WeatherService() // Inject dependencies
        let viewModel = WeatherViewModel(weatherService: weatherService)
        let weatherView = WeatherView(viewModel: viewModel)
        let weatherViewController = UIHostingController(rootView: weatherView)
        
        navigationController.pushViewController(weatherViewController, animated: true)
    }

}

