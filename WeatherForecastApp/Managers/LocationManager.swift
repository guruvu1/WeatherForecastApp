//
//  LocationManager.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 12/04/24.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject {
    let manager = CLLocationManager()
    @Published var placeMark: CLPlacemark?
    @Published var showSettingsAlert: Bool = false

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    private func lookUpCurrentLocation(location: CLLocation?) {
        if let location {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location, completionHandler: { placeMarks, error in
                if error == nil {
                    self.placeMark = placeMarks?[0]
                } else {
                    // An error occurred during geocoding.
                }
            })
        } else {
            // No location was available.
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lookUpCurrentLocation(location: locations.last)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
