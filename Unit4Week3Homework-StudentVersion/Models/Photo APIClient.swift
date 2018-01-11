//
//  Photo APIClient.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
struct PhotoAPIClient {
    private init() {}
    static let manager = PhotoAPIClient()
    func getImages(searchImageName: String, completionHandler: @escaping ([Photo]) -> Void, errorHandler: @escaping (AppError) -> Void) {
        let apiKey = "7290269-87746c9ade9d3696fd00edbce"
        let urlStrToAdjusted = searchImageName.components(separatedBy: " ").joined(separator: "+")
        let  urlStr = "https://pixabay.com/api/?key=\(apiKey)&q=\(urlStrToAdjusted)"
        print(urlStr)
        guard let url = URL(string: urlStr) else {
            errorHandler(.badURL)
            return
        }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let imagesData = try JSONDecoder().decode(allImageData.self, from: data)
                completionHandler(imagesData.hits)
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


