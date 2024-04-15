//
//  SearchLocationViewModelTests.swift
//  WeatherForecastAppTests
//
//  Created by Naveen Guruvu on 15/04/24.
//

@testable import WeatherForecastApp
import XCTest

final class SearchLocationViewModelTests: XCTestCase {
    var viewModel: SearchLocationViewModel!

    override func setUpWithError() throws {
        let cities = MockCityResponseProvider.getCitiesResponse()
        viewModel = SearchLocationViewModel(cities: cities ?? [])
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testSearchCity() {
        // Given (Arrange)
        let searchCity = "Srikakulam"

        // When (Act)
        viewModel.searchCity(searchCity: searchCity)

        // Then (Assert)
        XCTAssertTrue(!viewModel.searchedCities.isEmpty)
    }
    
    func testEmptySearchCity() {
        // Given (Arrange)
        let searchCity = ""

        // When (Act)
        viewModel.searchCity(searchCity: searchCity)

        // Then (Assert)
        XCTAssertTrue(viewModel.searchedCities.isEmpty)
    }
}
