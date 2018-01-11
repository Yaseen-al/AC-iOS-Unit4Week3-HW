//
//  ZipCodeHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q  on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import CoreLocation
// api http://api.aerisapi.com/observations/11219?client_id=Zz0UAmuo5H0SGY8HDGQLH&client_secret=FjZ845rwjHMjwpySRtpAkSBTBPk8OhZ0S3wV9HTO
//http://api.aerisapi.com/forecasts/search?query=name:manhattan&client_id=Zz0UAmuo5H0SGY8HDGQLH&client_secret=FjZ845rwjHMjwpySRtpAkSBTBPk8OhZ0S3wV9HTO
class ZipCodeHelper {
    private init() {}
    static let manager = ZipCodeHelper()
    func getLocationName(from zipCode: String, completionHandler: @escaping (String) -> Void, errorHandler: @escaping (Error) -> Void) {
        let geocoder = CLGeocoder()
        DispatchQueue.global(qos: .userInitiated).async {
            geocoder.geocodeAddressString(zipCode){(placemarks, error) -> Void in
                DispatchQueue.main.async {
                    if let placemark = placemarks?.first, let name = placemark.locality {
                        completionHandler(name)
                    } else {
                        errorHandler(error!)
                    }
                }
            }
        }
    }
}
