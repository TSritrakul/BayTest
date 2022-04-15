//
//  SettingWeatherModel.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 15/4/2565 BE.
//

import Foundation

// MARK: - SettingWeatherModel
public struct WeatherSettingModel: Codable, Hashable {
    public let lastCity: String?
    public let weatherUnits: WeatherUnits?

    public init(weatherUnits: WeatherUnits?, lastCity: String?) {
        self.weatherUnits = weatherUnits
        self.lastCity = lastCity
    }
    
    public enum WeatherUnits: String, Codable {
        case metric = "metric"
        case imperial = "imperial"
    }
}
