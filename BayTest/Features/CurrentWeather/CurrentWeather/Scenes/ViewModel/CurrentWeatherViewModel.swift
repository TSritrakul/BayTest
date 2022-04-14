//
//  CurrentWeatherViewModel.swift
//  CurrentWeather
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import Foundation
import Combine
import Data
import Moya

public class CurrentWeatherViewModel: ObservableObject {
    public init() {}
    
    @Published var cityName: String = ""
    @Published var temp: Double = 0.0
    @Published var humidity: Int = 0
    @Published var icon: URL?
    @Published var units: GetWeatherByCityRequest.WeatherUnits = .metric
    
    private let getWeatherByCityUseCase: GetWeatherByCityUseCase = GetWeatherByCityUseCaseImpl()
    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func getWeatherByCity() {
        if !self.cityName.isEmpty {
            self.getWeatherByCityUseCase.execute(city: self.cityName, unit: self.units).sink { error in

            } receiveValue: {  [weak self]response in
                guard let self = self else { return }
                self.temp = response.main?.temp ?? 0.0
                self.humidity = response.main?.humidity ?? 0
                if let iconCode: String = response.weather?.first?.icon, let iconURL: URL = URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png") {
                    self.icon = iconURL
                }
            }.store(in: &self.anyCancellable)
        }
    }
    
    func selectChangeUnit() {
        switch self.units {
        case .metric:
            self.units = .imperial
        case .imperial:
            self.units = .metric
        }
        
        self.getWeatherByCity()
    }
}
