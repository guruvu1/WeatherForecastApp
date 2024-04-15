//
//  MockCityResponseProvider.swift
//  WeatherForecastAppTests
//
//  Created by Naveen Guruvu on 15/04/24.
//

import Foundation
@testable import WeatherForecastApp

enum MockCityResponseProvider {
    private enum MockJsonFileTypes {
        case city

        var fileName: String {
            switch self {
            case .city:
                return "Cities"
            }
        }
    }

    static func getCitiesResponse() -> [WeatherForecastApp.City]? {
        return Utils.loadJson(fileName: MockJsonFileTypes.city.fileName)
    }
}
