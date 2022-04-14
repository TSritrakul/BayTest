//
//  PreviousWeatherView.swift
//  PreviousWeather
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import SwiftUI
import Kingfisher

public struct ForecastWeatherView: View {
    @ObservedObject var viewModel: ForecastWeatherViewModel
    
    public init(viewModel: ForecastWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationView {
            ZStack {
                Color(red: 248/255, green: 213/255, blue: 72/255).edgesIgnoringSafeArea(.all)
                List {
                    ForEach(self.viewModel.list ?? [], id: \.date) { list in
                        if let date = list.date {
                            Section(header: Text(date)) {
                                ForEach(list.list ?? [], id: \.time) { element in
                                    HStack {
                                        Spacer()
//                                            .frame(width: 10)
                                        Text(element.time ?? "")
                                        Spacer()
//                                            .frame(width: 10)
                                        if let icon = self.viewModel.getIconURL(icon: element.icon) {
                                            KFImage.url(icon)
                                                .resizable()
                                                .loadDiskFileSynchronously()
                                                .cacheMemoryOnly()
                                                .fade(duration: 0.25)
                                                .frame(width: 50, height: 50, alignment: .center)
                                        }
                                        VStack {
                                            Text("Temperature")
                                                .font(.headline)
                                            Text("\(String(format: "%.2f", element.temp ?? 0.0)) °C")
                                                .font(.body)
                                        }
                                        Spacer()
                                        VStack {
                                            Text("Humidity")
                                                .font(.headline)
                                            Text("\(element.humidity ?? 0)")
                                                .font(.body)
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
                .background(Color(red: 248/255, green: 213/255, blue: 72/255).edgesIgnoringSafeArea(.all))
            }
            .navigationBarTitle("Weather Forecast")
        }
    }
}
