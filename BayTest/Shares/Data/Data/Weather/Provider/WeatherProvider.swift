//
//  WeatherProvider.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation
import Moya
import Combine

enum WeatherProviderError: Error {
    case cityWrong
}

public protocol WeatherProvider {
    func getWeatherByCity(city: String, unit: WeatherUnits) -> AnyPublisher<GetWeatherByCityResponse, Error>
}

public class WeatherProviderImpl: WeatherProvider {
    
    let weatherAPI: MoyaProvider = MoyaProvider<WeatherAPI>()
    
    public init() {}
    
    public func getWeatherByCity(city: String, unit: WeatherUnits) -> AnyPublisher<GetWeatherByCityResponse, Error> {
        return weatherAPI.requestPublisher(.getWeatherByCity(request: .init(q: city, appid: "5efa33343d403d8d1bff7edeefc1bd4c", units: unit)))
            .map(GetWeatherByCityResponse.self)
            .mapError { moyaError in
                return WeatherProviderError.cityWrong
            }.eraseToAnyPublisher()
    }
}
