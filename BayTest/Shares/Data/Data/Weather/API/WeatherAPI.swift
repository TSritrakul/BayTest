//
//  WeatherAPI.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation
import Moya

public enum WeatherAPI {
    case getWeatherByCity(request: GetWeatherByCityRequest)
    case getWeatherForecastBuyCity(request: GetWeatherForecastByCityRequest)
}

extension WeatherAPI: TargetType {
    public var baseURL: URL {
        switch self {
        case .getWeatherByCity(let request):
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(request.q ?? "")&appid=\(request.appid ?? "")&units=\(request.units.rawValue)")!
        case .getWeatherForecastBuyCity(let request):
            return URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(request.q ?? "")&appid=\(request.appid ?? "")&units=\(request.units.rawValue)")!
        }
    }
    
    public var path: String {
        switch self {
        case . getWeatherByCity:
            return ""
        case .getWeatherForecastBuyCity:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case . getWeatherByCity, .getWeatherForecastBuyCity:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case . getWeatherByCity, .getWeatherForecastBuyCity:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
