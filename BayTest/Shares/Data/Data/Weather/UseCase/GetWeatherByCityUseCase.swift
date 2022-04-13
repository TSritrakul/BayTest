//
//  GetWeatherByCityUseCase.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation
import Combine

protocol WeatherUseCase {
    func getWeatherByCity(city: String) -> AnyPublisher<GetWeatherByCityResponse, Error>
}

class WeatherUseCaseImpl: WeatherUseCase {
    
    let weatherProvider: WeatherProvider = WeatherProviderImpl()
    
    func getWeatherByCity(city: String) -> AnyPublisher<GetWeatherByCityResponse, Error> {
        return self.weatherProvider.getWeatherByCity(city: city)
    }
}
