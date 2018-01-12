//
//  DetailWeatherView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
class DetailedWeatherView: UIView {
    lazy var backGroundView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imageView.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        imageView.addSubview(blurEffectView)
        return imageView
    }()
    lazy var perceptationLabel: UILabel = {
        let label = UILabel()
        label.text = "Precipitation"
        label.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.01)
        return label
    }()
    lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind Speed"
        label.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.01)
        return label
    }()
    lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunset"
        label.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.01)
        return label
    }()
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunrise"
        label.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.01)
        return label
    }()
    lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the low Temperature"
        label.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.01)
        return label
    }()
    lazy var highTempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.01)
        label.text = "This is The high Temperature"
        return label
    }()
    lazy var weatherDetailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [highTempLabel, lowTempLabel, sunriseLabel, sunsetLabel, windSpeedLabel, perceptationLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = UIStackViewAlignment.leading
        stackView.spacing = 5
        stackView.backgroundColor = .cyan
        return stackView
    }()
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "This is going to be The header label"
        label.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.01)
        return label
    }()
    lazy var weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "This is going to be the weather status label"
        label.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.01)
        return label
    }()
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
//        imageView.backgroundColor = UIColor.cyan
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubview(backGroundView)
        setupHeaderLabel()
        setupImageView()
        setupWeatherStatusLabel()
        setupStackView()
    }
    
    func setupHeaderLabel(){
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.85).isActive = true
        imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45).isActive = true
    }
    func setupWeatherStatusLabel() {
        addSubview(weatherStatusLabel)
        weatherStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherStatusLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        weatherStatusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setupStackView() {
        addSubview(weatherDetailsStackView)
        weatherDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherDetailsStackView.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor, constant: 10).isActive = true
        weatherDetailsStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        weatherDetailsStackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.85).isActive = true
        weatherDetailsStackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.35).isActive = true
    }
}





