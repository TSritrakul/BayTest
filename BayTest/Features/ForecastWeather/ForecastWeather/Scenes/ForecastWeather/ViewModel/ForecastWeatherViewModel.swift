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
        self.getWeatherForecastByCity()
    }
    
    @Published var list: [GetWeatherForecastByCityList]? = []
    
    private let getWeatherForecastByCityUseCase: GetWeatherForecastByCityUseCase = GetWeatherForecastByCityUseCaseImpl()
    private var anyCancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func getWeatherForecastByCity() {
        self.getWeatherForecastByCityUseCase.execute(city: "London", unit: .metric)
            .sink { error in
                
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                print(response)
                self.list = response.list
            }
            .store(in: &self.anyCancellable)
    }
    
    func getIconURL(data: GetWeatherForecastByCityList) -> URL? {
        return URL(string: "https://openweathermap.org/img/wn/\(data.weather?.first?.icon ?? "")@2x.png")
    }
}
