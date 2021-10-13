//
//  Weather.swift
//  Uweather
//
//  Created by Fatih Sağlam on 13.10.2021.
//

import Foundation

public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.weatherDescription ?? ""
        iconName = response.weather.first?.icon ?? ""
    }
}
