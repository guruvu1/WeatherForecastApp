//
//  DateFormatterManager.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 15/04/24.
//

import Foundation

final class DateFormatterManager {
    static let shared = DateFormatterManager()

    private init() {}

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
}
