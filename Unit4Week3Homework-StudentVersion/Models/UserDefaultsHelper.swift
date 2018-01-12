//
//  UserDefaultsHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
enum KeysForUserDefaults: String{
    case zipCode
}
struct UserDefaultsHelper {
    private init(){}
    static let manager = UserDefaultsHelper()
    private let defaults = UserDefaults()
    func saveZipCode(zipCode: Int){
        defaults.set(zipCode, forKey: KeysForUserDefaults.zipCode.rawValue)
    }
    func getZipCode() -> Int? {
        return defaults.value(forKey: KeysForUserDefaults.zipCode.rawValue) as? Int
    }
    
}
