//
//  HistoryIntegrationUseCase.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 12/04/24.
//

import Foundation

protocol HistoryIntegrationUseCase {
    func getWeatherHistory(searchedString: String, _ completion: @escaping (Result<LocationForecast, NetworkServiceError>) -> Void)
}
