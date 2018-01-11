//
//  Forcast Model.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
struct ForcastResults: Codable {
    let success: Bool
    let response: [ForcastWraper]
}

struct ForcastWraper: Codable {
    let loc: LocationWraper
    let interval: String
    let periods: [Forcast]
}
struct LocationWraper: Codable {
    let long: Double
    let lat: Double
}

struct Forcast: Codable{
    let validTime: String
    let maxTempC: Double
    let minTempC: Double
    let avgTempC: Double
    let precipMM: Double
    let iceaccum: Double?
    let maxHumidity: Double
    let minHumidity: Double
    let avgFeelslikeC: Double
    let windSpeedKPH: Double
    let weather: String
    let icon: String
    let sunriseISO: String
    let sunsetISO: String
}
