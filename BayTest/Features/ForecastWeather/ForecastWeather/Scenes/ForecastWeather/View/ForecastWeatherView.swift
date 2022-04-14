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
                    ForEach(self.viewModel.list ?? [], id: \.dtTxt) { list in
                        HStack {
                            if let icon = self.viewModel.getIconURL(data: list) {
                                Section(header: Text("5-Day FORECAST")) {
                                    KFImage.url(icon)
                                        .resizable()
                                        .loadDiskFileSynchronously()
                                        .cacheMemoryOnly()
                                        .fade(duration: 0.25)
                                        .frame(width: 50, height: 50, alignment: .center)
                                }
                            }
                        }
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                .background(Color(red: 248/255, green: 213/255, blue: 72/255).edgesIgnoringSafeArea(.all))
            }
        }
    }
}
