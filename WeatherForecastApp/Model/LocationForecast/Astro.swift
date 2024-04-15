//
//  Astro.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 12/04/24.
//

import Foundation

struct Astro: Codable {
    let sunrise: String?
    let sunset: String?
    let moonrise: String?
    let moonset: String?
    let moonPhase: String?
    let moonIllumination: Int?

    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}
