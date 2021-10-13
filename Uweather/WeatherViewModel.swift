//
//  WeatherViewModel.swift
//  Uweather
//
//  Created by Fatih Sağlam on 13.10.2021.
//

import SwiftUI

private let defaultIcon = "questionmark"
private let iconMap = [
    "Drizzle" : "cloud.fog.fill",
    "Thunderstorm" : "cloud.bolt.fill",
    "Rain" : "cloud.rain.fill",
    "Snow" : "cloud.snow.fill",
    "Clear" : "sun.max.fill",
    "Clouds" : "smoke.fill"
]


class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherIcon: String = ""
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)°C"
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}

