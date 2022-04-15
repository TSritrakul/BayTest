//
//  GetWeatherForecastByCityRequest.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 14/4/2565 BE.
//

import Foundation

// MARK: - GetWeatherByCityRequest
public struct GetWeatherForecastByCityRequest: Codable {
    let q, appid: String?
    let units: WeatherUnits

    public init(q: String?, appid: String?, units: WeatherUnits = .metric) {
        self.q = q
        self.appid = appid
        self.units = units
    }
    
    public enum WeatherUnits: String, Codable {
        case metric = "metric"
        case imperial = "imperial"
    }
}
