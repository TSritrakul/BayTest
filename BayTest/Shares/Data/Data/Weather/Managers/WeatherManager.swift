//
//  WeatherManager.swift
//  Data
//
//  Created by Thatchaphon Sritrakul on 15/4/2565 BE.
//

import Foundation
import Combine

public class WeatherManager {
    static public let shared: WeatherManager = WeatherManager()
    private let defaults = UserDefaults.standard
    
    public init() {
        self.initWeatherSetting()
    }
    
    public let weatherSetting: CurrentValueSubject<WeatherSettingModel, Never> = CurrentValueSubject<WeatherSettingModel, Never>(.init(weatherUnits: nil, lastCity: ""))
    
    public func saveWeatherSetting(setting: WeatherSettingModel) {
        self.defaults.set(setting.weatherUnits?.rawValue, forKey: "UnitSetting")
        self.defaults.set(setting.lastCity, forKey: "LastCity")
        self.initWeatherSetting()
    }
    
    private func initWeatherSetting() {
        guard let unit = self.defaults.string(forKey: "UnitSetting"), let lastCity = self.defaults.string(forKey: "LastCity") else { return }
        self.weatherSetting.send(.init(weatherUnits: unit == "metric" ? .metric : .imperial, lastCity: lastCity))
    }
}
