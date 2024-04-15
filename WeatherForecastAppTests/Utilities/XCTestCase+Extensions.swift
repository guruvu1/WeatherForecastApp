//
//  XCTestCase+Extensions.swift
//  WeatherForecastAppTests
//
//  Created by Naveen Guruvu on 13/04/24.
//

import Foundation
@testable import WeatherForecastApp
import XCTest

extension XCTestCase {
    func waitOneRunLoop(msg: String = "mainThread", timeout: TimeInterval = 5) {
        let expectation = expectation(description: msg)
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
}
