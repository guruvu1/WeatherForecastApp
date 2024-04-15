//
//  MockHistoryResponseProvider.swift
//  WeatherForecastAppTests
//
//  Created by Naveen Guruvu on 13/04/24.
//

@testable import WeatherForecastApp

enum MockHistoryResponseProvider {
    private enum MockJsonFileTypes {
        case locationForecast

        var fileName: String {
            switch self {
            case .locationForecast:
                return "LocationForecast"
            }
        }
    }

    static func getHistoryResponse() -> WeatherForecastApp.LocationForecast? {
        return Utils.loadJson(fileName: MockJsonFileTypes.locationForecast.fileName)
    }
}
