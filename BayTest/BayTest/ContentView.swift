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
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: self.$selection, content: {
            CurrentWeatherView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Current")
                }
                .tag(0)
            PreviousWeatherView()
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Previous")
                }
                .tag(1)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
