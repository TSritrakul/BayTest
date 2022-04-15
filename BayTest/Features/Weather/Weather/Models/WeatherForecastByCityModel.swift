//
//  WeatherForecastByCityModel.swift
//  ForecastWeather
//
//  Created by Thatchaphon Sritrakul on 14/4/2565 BE.
//

import Foundation

// MARK: - WeatherForecastByCityModelElement
public struct WeatherForecastByCityModelElement: Codable, Hashable {
    public var list: [WeatherForecastByCityList]?
    public let date: String?

    public init(list: [WeatherForecastByCityList]?, date: String?) {
        self.list = list
        self.date = date
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - WeatherForecastByCityList
public struct WeatherForecastByCityList: Codable, Hashable {
    public let temp: Double?
    public let humidity: Int?
    public let icon, time: String?

    enum CodingKeys: String, CodingKey {
        case temp, humidity, icon
        case time = "time"
    }

    public init(temp: Double?, humidity: Int?, icon: String?, time: String?) {
        self.temp = temp
        self.humidity = humidity
        self.icon = icon
        self.time = time
    }
}

public typealias WeatherForecastByCityModel = [WeatherForecastByCityModelElement]
