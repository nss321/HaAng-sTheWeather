//
//  Forecast.swift
//  HaAng'sTheWeather
//
//  Created by BAE on 2023/04/26.
//

import Foundation

struct Forecast: Identifiable {
    var id = UUID()
    
    let day: String
    let lowTemperature: Int
    let highTemperature: Int
    let imageName: String
    let arrange: CGFloat
}

var forecast = [
    Forecast(day: "오늘",
             lowTemperature: 11,
             highTemperature: 18,
             imageName: "cloud.sun.fill",
             arrange: 100),
    Forecast(day: "화",
             lowTemperature: 9,
             highTemperature: 21,
             imageName: "sun.max.fill",
             arrange: 120),
    Forecast(day: "수",
             lowTemperature: 7,
             highTemperature: 17,
             imageName: "cloud.fill",
             arrange: 100)
]
