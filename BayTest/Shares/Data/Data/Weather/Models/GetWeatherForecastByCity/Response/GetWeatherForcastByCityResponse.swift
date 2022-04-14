//
//  GetWeatherForcastByCityResponse.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 14/4/2565 BE.
//

import Foundation

// MARK: - GetWeatherForecastByCityResponse
public struct GetWeatherForecastByCityResponse: Codable, Hashable {
    public let list: [GetWeatherForecastByCityList]?

    public init(list: [GetWeatherForecastByCityList]?) {
        self.list = list
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - GetWeatherForecastByCityList
public struct GetWeatherForecastByCityList: Codable, Hashable {
    public let main: GetWeatherForecastByCityMain?
    public let weather: [GetWeatherForecastByCityWeather]?
    public let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case main, weather
        case dtTxt = "dt_txt"
    }

    public init(main: GetWeatherForecastByCityMain?, weather: [GetWeatherForecastByCityWeather]?, dtTxt: String?) {
        self.main = main
        self.weather = weather
        self.dtTxt = dtTxt
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - GetWeatherForecastByCityMain
public struct GetWeatherForecastByCityMain: Codable, Hashable {
    public let temp: Double?
    public let humidity: Int?

    public init(temp: Double?, humidity: Int?) {
        self.temp = temp
        self.humidity = humidity
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - GetWeatherForecastByCityWeather
public struct GetWeatherForecastByCityWeather: Codable, Hashable {
    public let icon: String?

    public init(icon: String?) {
        self.icon = icon
    }
}
