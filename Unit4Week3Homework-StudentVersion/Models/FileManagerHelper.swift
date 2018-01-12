//
//  FileManagerHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
class FileManagerHelper {
    private init() {}
    let savedImagesPath = "allSavedImages"
    static let manager = FileManagerHelper()
    private var savedImages = [Photo]() {
        didSet {
            print(savedImages)
            removeDupes()
            saveImages()
        }
    }
    
    //Saving Images To Disk
    func saveImage(with urlStr: String, image: UIImage) {
        let imageData = UIImagePNGRepresentation(image)
        let imagePathName = urlStr.components(separatedBy: "/").last!
        let url = dataFilePath(withPathName: imagePathName)
        do {
            try imageData?.write(to: url)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    func getImage(with urlStr: String) -> UIImage? {
        do {
            let imagePathName = urlStr.components(separatedBy: "/").last!
            let url = dataFilePath(withPathName: imagePathName)
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    func removeDupes() {
        var imageURLSet = Set<String>()
        var noDupeArr = [Photo]()
        for image in savedImages {
            let (inserted, _) = imageURLSet.insert(image.webformatURL)
            if inserted {
                noDupeArr.append(image)
            }
        }
        if savedImages.count != noDupeArr.count { savedImages = noDupeArr }
    }
    
    func addNew(newPhoto: Photo) {
        savedImages.append(newPhoto)
    }
    func getAllPhotos() -> [Photo] {
        return savedImages
    }
    
    private func saveImages() {
        let propertyListEncoder = PropertyListEncoder()
        do {
            let encodedData = try propertyListEncoder.encode(savedImages)
            let phoneURL = dataFilePath(withPathName: savedImagesPath)
            try encodedData.write(to: phoneURL, options: .atomic)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadImages() {
        let propertyListDecoder = PropertyListDecoder()
        do {
            let phoneURL = dataFilePath(withPathName: savedImagesPath)
            let encodedData = try Data(contentsOf: phoneURL)
            let storedImages = try propertyListDecoder.decode([Photo].self, from: encodedData)
            savedImages = storedImages
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    //USE THIS ONE
    private func dataFilePath(withPathName path: String) -> URL {
        return FileManagerHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    //THIS IS ONLY FOR THE ABOVE METHOD
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
