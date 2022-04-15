//
//  PreviousWeatherViewModel.swift
//  PreviousWeather
//
//  Created by Thatchaphon Sritrakul on 14/4/2565 BE.
//

import Foundation
import Data
import Combine

public class ForecastWeatherViewModel: ObservableObject {
    public init() {
        self.units = WeatherManager.shared.weatherSetting.value.weatherUnits == .imperial ? .imperial : .metric
        self.cityName = WeatherManager.shared.weatherSetting.value.lastCity ?? ""
        self.getWeatherForecastByCity(city: self.cityName, unit: self.units)
    }
    
    @Published var list: WeatherForecastByCityModel? = []
    @Published var units: GetWeatherForecastByCityRequest.WeatherUnits = .metric
    @Published var cityName: String = ""
    
    private let getWeatherForecastByCityUseCase: GetWeatherForecastByCityUseCase = GetWeatherForecastByCityUseCaseImpl()
    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func getWeatherForecastByCity(city: String, unit: GetWeatherForecastByCityRequest.WeatherUnits) {
        self.getWeatherForecastByCityUseCase.execute(city: city, unit: unit)
            .sink { error in
                
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.list = self.wrapData(response: response.list ?? [])
            }
            .store(in: &self.anyCancellable)
    }
    
    func getIconURL(icon: String?) -> URL? {
        return URL(string: "https://openweathermap.org/img/wn/\(icon ?? "")@2x.png")
    }
    
    func wrapData(response: [GetWeatherForecastByCityList]) -> WeatherForecastByCityModel {
        var list: WeatherForecastByCityModel = []
        
        let dateReasponse = DateFormatter()
        dateReasponse.dateFormat = "yyyy-mm-dd HH:mm:ss"
        
        let dateList = DateFormatter()
        dateList.dateFormat = "E  d MMM yyyy"
        
        let time = DateFormatter()
        time.dateFormat = "HH:mm"
        
        for element in response {
            
            if let group = list.first(where: { item in
                
                if dateList.string(from: dateList.date(from: item.date ?? "") ?? Date()) == dateList.string(from: dateReasponse.date(from: element.dtTxt ?? "") ?? Date()) {
                    return true
                } else {
                    return false
                }
            }) {
                if let index = list.firstIndex(of: group) {
                    list[index].list?.append(.init(temp: element.main?.temp, humidity: element.main?.humidity, icon: element.weather?.first?.icon, time: time.string(from: dateReasponse.date(from: element.dtTxt ?? "") ?? Date())))
                }
            } else {
                list.append(.init(list: [.init(temp: element.main?.temp, humidity: element.main?.humidity, icon: element.weather?.first?.icon, time: time.string(from: dateReasponse.date(from: element.dtTxt ?? "") ?? Date()))], date: dateList.string(from: dateReasponse.date(from: element.dtTxt ?? "") ?? Date())))
            }
        }
        return list
    }
}
