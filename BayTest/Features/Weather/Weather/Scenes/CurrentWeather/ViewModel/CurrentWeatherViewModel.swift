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
    
    @Published var cityName: String = ""
    @Published var temp: Double = 0.0
    @Published var humidity: Int = 0
    @Published var icon: URL?
    @Published var message: String?
    @Published var units: GetWeatherByCityRequest.WeatherUnits = .metric
    
    private let getWeatherByCityUseCase: GetWeatherByCityUseCase = GetWeatherByCityUseCaseImpl()
    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    public init() {
        self.subscribeWeatherSetting()
    }
    
    func getWeatherByCity() {
        if !self.cityName.isEmpty {
            self.getWeatherByCityUseCase.execute(city: self.verifyCityName(cityName: self.cityName), unit: self.units).sink { error in

            } receiveValue: {  [weak self] response in
                print(response)
                guard let self = self else { return }
                if let temp = response.main?.temp, let humidity = response.main?.humidity {
                    self.temp = temp
                    self.humidity = humidity
                    if let iconCode: String = response.weather?.first?.icon, let iconURL: URL = URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png") {
                        self.icon = iconURL
                    }
                    self.message = nil
                } else {
                    self.temp = 0.0
                    self.humidity = 0
                    self.icon = nil
                    self.message = "Something Wrong"
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
        
        self.saveWeatherSetting()
    }
    
    func saveWeatherSetting() {
        WeatherManager.shared.saveWeatherSetting(setting: .init(weatherUnits: self.units == .metric ? .metric : .imperial, lastCity: self.verifyCityName(cityName: self.cityName)))
    }
    
    func subscribeWeatherSetting() {
        WeatherManager.shared.weatherSetting.sink { [weak self] setting in
            guard let self = self else { return }
            guard let cityName: String = setting.lastCity, let unit = setting.weatherUnits else { return }
            self.units = unit == .metric ? .metric : .imperial
            self.cityName = cityName
            self.getWeatherByCity()
        }
        .store(in: &self.anyCancellable)
    }
    
    func verifyCityName(cityName: String) -> String {
        var wordVerified: String = cityName

        let vowels: Set<Character> = [" ", "~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "+", "=", "{", "}", "[", "]", "|", "\\", "/", ":", ";", "\"", "'", "<", ">", ",", ".", "?"]
        wordVerified.removeAll(where: { vowels.contains($0) })
        return wordVerified
    }
}
