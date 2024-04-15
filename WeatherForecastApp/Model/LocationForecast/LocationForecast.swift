//
//  LocationForecast.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 12/04/24.
//

import Foundation

struct LocationForecast: Codable {
    let location: Location?
    let forecast: ForeCast?

    enum CodingKeys: String, CodingKey {
        case location
        case forecast
    }
}
