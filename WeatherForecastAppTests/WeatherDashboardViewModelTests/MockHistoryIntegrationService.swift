//
//  MockHistoryIntegrationService.swift
//  WeatherForecastAppTests
//
//  Created by Naveen Guruvu on 13/04/24.
//

import Foundation
@testable import WeatherForecastApp

class MockHistoryIntegrationService: HistoryIntegrationUseCase {
    var isGetWeatherHistorySuccess: Bool = false
    var isGetWeatherHistoryNetworkFailure: Bool = false

    func getWeatherHistory(searchedString: String, _ completion: @escaping (Result<LocationForecast, NetworkServiceError>) -> Void) {
        if isGetWeatherHistorySuccess, let response = MockHistoryResponseProvider.getHistoryResponse() {
            completion(.success(response))
        } else {
            if isGetWeatherHistoryNetworkFailure {
                completion(.failure(.noInternet))
            } else {
                completion(.failure(.invalidResponse))
            }
        }
    }
}
