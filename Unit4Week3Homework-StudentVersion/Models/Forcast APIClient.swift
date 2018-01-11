//
//  Forcast APIClient.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
struct ForcastAPIClient {
    private init() {}
    static let manager = ForcastAPIClient()
    func getForcasts(for zipCode: String, completionHandler: @escaping ([Forcast]) -> Void, errorHandler: @escaping (AppError) -> Void) {
        let APIAuthinticationRequirments =  "client_id=Zz0UAmuo5H0SGY8HDGQLH&client_secret=FjZ845rwjHMjwpySRtpAkSBTBPk8OhZ0S3wV9HTO"
        let urlStr = "http://api.aerisapi.com/forecasts/\(zipCode)?\(APIAuthinticationRequirments)"
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let results = try JSONDecoder().decode(ForcastResults.self, from: data)
                
                guard let forcast = results.response.first?.periods else {
                    errorHandler(AppError.noDataReceived)
                    return
                }
                completionHandler(forcast)
            }
            catch {
                errorHandler(.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: {print($0)})
    }
}
