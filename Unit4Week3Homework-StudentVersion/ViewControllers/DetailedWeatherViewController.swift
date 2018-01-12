//
//  DetailedWeatherViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SceneKit
enum AnimationKeys: String {
    case imageExit = "escapes the image to the corner"
}
class DetailedWeatherViewController: UIViewController {
    var photo: UIImage?{
        didSet{
            detailedView.imageView.image = photo
        }
    }
    var currentPhoto: Photo? {
        didSet{
            guard let photo = currentPhoto else {
                return
            }
            ImageAPIClient.manager.getImage(from:photo.webformatURL, completionHandler: {self.photo = $0}, errorHandler: {print($0)})
        }
    }
    var photos = [Photo](){
        didSet{
            guard !photos.isEmpty else {
                return
            }
            self.currentPhoto = photos[Int(arc4random_uniform(UInt32(photos.count)))]
            
        }
    }
    var cityName: String?{
        didSet{
            detailedView.headerLabel.text = "Weather Forcast for \(cityName!)"
        }
    }
    var forcast: Forcast?{
        didSet{
            detailedView.weatherStatusLabel.text = "\(forcast!.weather)"
            detailedView.highTempLabel.text = "High Temp: \(forcast!.maxTempC)"
            detailedView.lowTempLabel.text = "Low Temp: \(forcast!.minTempC)"
            detailedView.perceptationLabel.text = "Perceptation: \(forcast!.precipMM)"
            detailedView.sunriseLabel.text = "Sunrise : \(forcast!.sunriseISO.components(separatedBy: "T")[1])"
            detailedView.sunsetLabel.text = "Sunset: \(forcast!.sunsetISO.components(separatedBy: "T")[1])"
            detailedView.windSpeedLabel.text = "Wind Speed: \(forcast!.windSpeedKPH) km/Hr"
        }
    }
    func loadImages(){
        guard let cityName = cityName else {
            return
        }
        PhotoAPIClient.manager.getImages(searchImageName: cityName, completionHandler: {self.photos = $0}, errorHandler: {print($0)})
    }
    
    let detailedView = DetailedWeatherView()
    override func viewDidLoad() {
        self.view.backgroundColor = .gray
        view.addSubview(detailedView)
        detailedView.imageView.image = #imageLiteral(resourceName: "hamburg")
        detailedView.backGroundView.image = #imageLiteral(resourceName: "nature")
        configureNavBar()
    }
    
    func configureNavBar(){
        // Adding a Title to the navBar
        navigationItem.title =  "Forcast"
        // adding a Button to the right side of the navBar
        let saveBarItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveForcast))
        navigationItem.rightBarButtonItem = saveBarItem
    }
    @objc func saveForcast() {
        guard let photo = currentPhoto else {
            return
        }
        // chosing to save the image or to cancel through an alert controller that have a yes to save and cancel to discard
        let alert = UIAlertController(title: "Do you want to save the image to your Favourites", message: "", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Ok", style: .default){(handler) in
            FileManagerHelper.manager.addNew(newPhoto: photo)
            self.animateImage()
//            self.tabBarController?.selectedIndex = 2
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    // ToDo animation Stuff
    func animateImage(){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        let toValue = CATransform3DMakeScale(0.02, 0.02, 0)
        let fromValue = CATransform3DMakeScale(1, 1, 0)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 2.0
        detailedView.imageView.layer.add(animation, forKey: AnimationKeys.imageExit.rawValue)
        animateTranslation()
    }
    func animateTranslation() {
        let fromValue = CATransform3DMakeScale(1, 1, 0)
        let toValue = CATransform3DMakeScale(-700, -200, 0)
//        CATransform3DMakeScale(<#T##sx: CGFloat##CGFloat#>, <#T##sy: CGFloat##CGFloat#>, <#T##sz: CGFloat##CGFloat#>)
        let animation = CABasicAnimation(keyPath: "transform.translation")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 2
        detailedView.imageView.layer.add(animation, forKey: nil)
    }
}



