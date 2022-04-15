//
//  ContentView.swift
//  BayTest
//
//  Created by Thatchaphon Sritrakul on 13/4/2565 BE.
//

import SwiftUI
import Weather

struct ContentView: View {
    init() {
//        UITabBar.appearance().backgroundColor = UIColor(red: 108/255, green: 96/255, blue: 94/255, alpha: 50)
    }
    
    @State private var selection = 0
    
    var body: some View {
        CurrentWeatherView(viewModel: CurrentWeatherViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
