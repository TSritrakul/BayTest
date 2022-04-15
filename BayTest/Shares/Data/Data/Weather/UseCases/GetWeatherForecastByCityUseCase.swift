//
//  GetWeatherForecastByCityUseCase.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 14/4/2565 BE.
//

import Foundation
import Combine

public protocol GetWeatherForecastByCityUseCase {
    func execute(city: String, unit: GetWeatherForecastByCityRequest.WeatherUnits) -> AnyPublisher<GetWeatherForecastByCityResponse, Error>
}

public class GetWeatherForecastByCityUseCaseImpl: GetWeatherForecastByCityUseCase {
    
    private let weatherProvider: WeatherProvider
    
    public init(weatherProvider: WeatherProvider = WeatherProviderImpl()) {
        self.weatherProvider = weatherProvider
    }
    
    public func execute(city: String, unit: GetWeatherForecastByCityRequest.WeatherUnits) -> AnyPublisher<GetWeatherForecastByCityResponse, Error> {
        return self.weatherProvider.getWeatherForecastByCity(city: city, unit: unit)
    }
}
