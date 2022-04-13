//
//  WeatherAPI.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation
import Moya

enum WeatherAPI {
    case getWeatherByCity(request: GetWeatherByCityRequest)
}

extension WeatherAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org")!
    }
    
    var path: String {
        switch self {
        case . getWeatherByCity:
            return "/data/2.5/weather"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case . getWeatherByCity:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case . getWeatherByCity(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
