//
//  WeatherDashboardViewModel.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 12/04/24.
//

import Foundation

class WeatherDashboardViewModel: ObservableObject {
    @Published var locationForecast: LocationForecast?
    @Published var errorMessage: ToastMessageModel?
    @Published var isLoading: Bool = false
    @Published var showBanner: Bool = false
    private(set) var cities: [City] = []
    private let historyIntegrationUseCase: HistoryIntegrationUseCase

    init(historyIntegrationUseCase: HistoryIntegrationUseCase) {
        self.historyIntegrationUseCase = historyIntegrationUseCase
        loadCities()
    }

    func getHistory(searchedString: String?) {
        guard let searchedString, !searchedString.isEmpty else {
            return
        }
        isLoading = true
        historyIntegrationUseCase.getWeatherHistory(searchedString: searchedString) { [weak self] result in
            guard let self else {
                return
            }
            isLoading = false
            switch result {
            case .success(let response):
                self.locationForecast = response
                updateLocationHistory(searchedString: searchedString, locationForecast: response)
            case .failure(let failure):
                if NetworkServiceError.noInternet == failure {
                    self.locationForecast = AppUserDefaults.locationHistory?[searchedString]
                }
                errorMessage = ToastMessageModel(title: failure.errorDescription)
                showBanner = locationForecast == nil
            }
        }
    }

    private func updateLocationHistory(searchedString: String, locationForecast: LocationForecast) {
        var locationHistory = AppUserDefaults.locationHistory
        if (locationHistory ?? [:]).isEmpty {
            AppUserDefaults.locationHistory = [searchedString: locationForecast]
        } else {
            locationHistory?[searchedString] = locationForecast
            AppUserDefaults.locationHistory = locationHistory
            AppUserDefaults.selectedLocation = searchedString
        }
    }

    private func loadCities() {
        Task {
            let cities: [City]? = try? await "Cities".loadJson()
            self.cities = cities?.sorted(by: { $0.city ?? "" < $1.city ?? "" }) ?? []
        }
    }
}
