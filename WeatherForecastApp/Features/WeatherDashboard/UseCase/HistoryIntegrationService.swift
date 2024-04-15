//
//  HistoryIntegrationService.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 12/04/24.
//

import Foundation

class HistoryIntegrationService {
    let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
}

extension HistoryIntegrationService: HistoryIntegrationUseCase {
    func getWeatherHistory(searchedString: String, _ completion: @escaping (Result<LocationForecast, NetworkServiceError>) -> Void) {
        let today = Date()
        let requestParams = [
            "key": Config.apiKey,
            "dt": today.toString(),
            "end_dt": today.nextDate?.toString() ?? "",
            "q": searchedString
        ]
        networkManager.callAPI(.get, endPoint: "v1/history.json", parameters: requestParams, completionHandler: completion)
    }
}
