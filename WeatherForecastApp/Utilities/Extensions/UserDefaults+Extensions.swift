//
//  UserDefaults+Extensions.swift
//  WeatherForecastApp
//
//  Created by Naveen Guruvu on 13/04/24.
//

import Foundation

protocol PersistentObject {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}

enum PersistentObjectError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"

    var errorDescription: String? {
        rawValue
    }
}

extension UserDefaults: PersistentObject {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw PersistentObjectError.unableToEncode
        }
    }

    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data = data(forKey: forKey) else { throw PersistentObjectError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw PersistentObjectError.unableToDecode
        }
    }
}
