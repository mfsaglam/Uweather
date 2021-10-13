//
//  UweatherApp.swift
//  Uweather
//
//  Created by Fatih Sağlam on 12.10.2021.
//

import SwiftUI

@main
struct UweatherApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = WeatherViewModel(weatherService: WeatherService())
            ContentView(vm: viewModel)
        }
    }
}
