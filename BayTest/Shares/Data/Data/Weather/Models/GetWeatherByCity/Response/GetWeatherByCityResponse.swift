//
//  GetWeatherByCityResponse.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation

// MARK: - GetWeatherByCityResponse
public struct GetWeatherByCityResponse: Codable {
    public let weather: [GetWeatherByCityWeather]?
    public let main: GetWeatherByCityMain?

    public init(weather: [GetWeatherByCityWeather]?, main: GetWeatherByCityMain?) {
        self.weather = weather
        self.main = main
    }
}

// MARK: - GetWeatherByCityMain
public struct GetWeatherByCityMain: Codable {
    public let temp: Double?
    public let humidity: Int?

    public init(temp: Double?, humidity: Int?) {
        self.temp = temp
        self.humidity = humidity
    }
}

// MARK: - GetWeatherByCityWeather
public struct GetWeatherByCityWeather: Codable {
    public let icon: String?

    public init(icon: String?) {
        self.icon = icon
    }
}
