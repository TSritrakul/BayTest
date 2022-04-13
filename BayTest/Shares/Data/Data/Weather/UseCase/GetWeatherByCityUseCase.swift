//
//  GetWeatherByCityUseCase.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation
import Combine

public protocol GetWeatherByCityUseCase {
    func execute(city: String, unit: WeatherUnits) -> AnyPublisher<GetWeatherByCityResponse, Error>
}

public class GetWeatherByCityUseCaseImpl: GetWeatherByCityUseCase {
    
    private let weatherProvider: WeatherProvider
    
    public init(weatherProvider: WeatherProvider = WeatherProviderImpl()) {
        self.weatherProvider = weatherProvider
    }
    
    public func execute(city: String, unit: WeatherUnits) -> AnyPublisher<GetWeatherByCityResponse, Error> {
        return self.weatherProvider.getWeatherByCity(city: city, unit: unit)
    }
}
