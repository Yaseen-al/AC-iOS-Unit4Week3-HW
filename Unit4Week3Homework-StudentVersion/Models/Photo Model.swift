//
//  Photo Model.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
struct allImageData: Codable {
    let hits: [Photo]
}
struct Photo: Codable {
    let likes: Double
    let favorites: Double
    let previewURL: String
    let webformatURL: String
    let user: String
    let tags: String
}
