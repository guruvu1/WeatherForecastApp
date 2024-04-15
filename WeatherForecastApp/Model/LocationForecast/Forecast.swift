//
//  ForeCast.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 12/04/24.
//

import Foundation
struct ForeCast: Codable {
    let foreCastDay: [ForeCastDay]?

    enum CodingKeys: String, CodingKey {
        case foreCastDay = "forecastday"
    }
}
