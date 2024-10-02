//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Venuka Valiveti on 28/09/24.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var coordinator: WeatherCoordinator?

        init() {
            let navigationController = UINavigationController()
            coordinator = WeatherCoordinator(navigationController: navigationController)
            coordinator?.start()
        }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.locale, .init(identifier: "en")) //For German Language we use "de"
        }
    }
}
