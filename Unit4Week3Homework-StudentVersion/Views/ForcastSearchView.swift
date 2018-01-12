//
//  forcastSearchView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/7/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class ForcastSearchView: UIView {
    lazy var backGroundView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("testMe", for: UIControlState.normal)
        
        button.titleLabel?.textColor = .black
        button.backgroundColor = .orange
        return button
    }()
    
    var zipCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your Zip Code"
        label.textAlignment = .center
        //        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        //backgroundColor
        label.backgroundColor = .clear
        return label
    }()
    var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your Zip Code"
        textField.contentMode = .center
        textField.backgroundColor = UIColor(displayP3Red: 238/255, green: 242/255, blue: 245/255, alpha: 1 )
        textField.layer.cornerRadius = 4.0
        textField.layer.shadowOpacity = 0.15
        return textField
    }()
    var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather of New York"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        //backgroundColor
        label.backgroundColor = .clear
        return label
    }()
    lazy var collectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cView.backgroundColor = .clear
        cView.register(CustomSearchCollectionViewCell.self, forCellWithReuseIdentifier: "cityWeatherCell")
        return cView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        backgroundColor = .white
        setupViews()
    }
    private func setupViews(){
        addSubview(backGroundView)
        setupCityLabel()
        setupCollectioView()
        setupSearchTextField()
        setupZipCodeLabel()
        //        setupTestButton()
        
    }
    private func setupCityLabel(){
        //TODO add the constraints
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.85).isActive = true
    }
    private func setupCollectioView(){
        //TODO add the constraints
        addSubview(collectioView)
        collectioView.translatesAutoresizingMaskIntoConstraints = false
        collectioView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectioView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10).isActive = true
        collectioView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        collectioView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
    }
    private func setupSearchTextField(){
        //TODO add the constraints
        addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.60).isActive = true
        searchTextField.topAnchor.constraint(equalTo: collectioView.bottomAnchor, constant: 20).isActive = true
    }
    private func setupZipCodeLabel(){
        //TODO add the constraints
        addSubview(zipCodeLabel)
        zipCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        zipCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        zipCodeLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
        zipCodeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
    }
    private func setupTestButton(){
        addSubview(testButton)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        testButton.topAnchor.constraint(equalTo: zipCodeLabel.bottomAnchor, constant: 20).isActive = true
        testButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45).isActive = true
    }
}

