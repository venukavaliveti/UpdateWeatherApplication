//
//  WeatherData1Model.swift
//  WeatherApp
//
//  Created by Venuka Valiveti on 28/09/24.
//


import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

// Enum to handle different types of errors
enum WeatherError: Error, LocalizedError {
    case networkError
    case invalidCity
    case unknownError
    case decodingError(Error)
    case apiError(Int, String)
    
    var errorDescription: String? {
        switch self {
        case .networkError:
            return "Failed to connect. Please check your network connection."
        case .invalidCity:
            return "Invalid city name. Please try again."
        case .unknownError:
            return "An unknown error occurred. Please try again later."
        case .decodingError(_):
            return "Failed to decode data"
        case .apiError(let code, let message):
            switch code {
            case 401:
                return "Invalid API key"
            case 404:
                return "City not found"
            case 500, 502:
                return "Server error, try again later"
            default:
                return "Unknown API error: \(code), \(message)"
            }
        }
    }
}
