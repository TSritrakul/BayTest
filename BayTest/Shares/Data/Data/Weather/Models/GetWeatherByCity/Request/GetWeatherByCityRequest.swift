//
//  GetWeatherByCityRequest.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation

public enum WeatherUnits: String, Codable {
    case metric = "metric"
    case imperial = "imperial"
}

// MARK: - GetWeatherByCityRequest
public struct GetWeatherByCityRequest: Codable {
    let q, appid: String?
    let units: WeatherUnits

    public init(q: String?, appid: String?, units: WeatherUnits = .metric) {
        self.q = q
        self.appid = appid
        self.units = units
    }
}
