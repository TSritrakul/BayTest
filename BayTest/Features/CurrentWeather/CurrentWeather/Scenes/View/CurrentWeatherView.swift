//
//  CurrentWeatherView.swift
//  CurrentWeather
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import SwiftUI
import Kingfisher

public struct CurrentWeatherView: View {
    @ObservedObject var viewModel: CurrentWeatherViewModel
    
    public init(viewModel: CurrentWeatherViewModel = CurrentWeatherViewModel()) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            TextField("City", text: self.$viewModel.cityName) {
                self.viewModel.getWeatherByCity()
            }
            .multilineTextAlignment(.center)
            .textFieldStyle(.roundedBorder)
            .frame(width: 100, height: 30, alignment: .center)
            Spacer()
                .frame(height: 30)
            HStack {
                Spacer()
                VStack {
                    Text("Temperature")
                        .font(.headline)
                    switch self.viewModel.units {
                    case .metric:
                        Text("\(String(format: "%.2f", self.viewModel.temp)) °C")
                            .font(.body)
                    case .imperial:
                        Text("\(String(format: "%.2f", self.viewModel.temp)) °F")
                            .font(.body)
                    }
                }
                Spacer()
                VStack {
                    Text("Humidity")
                        .font(.headline)
                    Text("\(self.viewModel.humidity)")
                        .font(.body)
                }
                Spacer()
            }
            
            if let icon = self.viewModel.icon {
                KFImage.url(icon)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
            }
            
            Button {
                self.viewModel.selectChangeUnit()
            } label: {
                switch self.viewModel.units {
                case .metric:
                    Text("Change °C to °F")
                        .font(.body)
                case .imperial:
                    Text("Change °F to °C")
                        .font(.body)
                }
            }
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            Spacer()
        }
    }
}
