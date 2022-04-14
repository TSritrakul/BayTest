//
//  ContentView.swift
//  BayTest
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import SwiftUI
import CurrentWeather
import PreviousWeather

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 108/255, green: 96/255, blue: 94/255, alpha: 50)
    }
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: self.$selection, content: {
            CurrentWeatherView(viewModel: CurrentWeatherViewModel())
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Current")
                }
                .tag(0)
                .background(Color(red: 248/255, green: 213/255, blue: 72/255))
            PreviousWeatherView(viewModel: PreviousWeatherViewModel())
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Previous")
                }
                .tag(1)
                .background(Color(red: 248/255, green: 213/255, blue: 72/255))
        })
        .accentColor(Color(red: 248/255, green: 213/255, blue: 72/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
