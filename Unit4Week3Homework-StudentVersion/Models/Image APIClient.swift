//
//  Image APIClient.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
struct ImageAPIClient {
    private init() {}
    static let manager = ImageAPIClient()
    func getImage(from urlStr: String, completionHandler: @escaping (UIImage)->Void, errorHandler: @escaping (Error)->Void){
        guard let url = URL(string: urlStr) else {
            errorHandler(AppError.badURL)
            return
        }
        let completionHandler: (Data)->Void = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else {
                errorHandler(AppError.notAnImage)
                return
            }
            completionHandler(onlineImage)
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completionHandler, errorHandler: {print($0)})
    }
}
