//
//  WeatherForecastAppApp.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 12/04/24.
//

import SwiftUI

@main
struct WeatherForecastAppApp: App {
    private var networkManager: NetworkManager

    init() {
        networkManager = NetworkManager(baseURL: Constants.baseURL)
    }

    var body: some Scene {
        WindowGroup {
            WeatherDashboardView(viewModel: WeatherDashboardViewModel(historyIntegrationUseCase: HistoryIntegrationService(networkManager: networkManager)))
        }
    }
}
