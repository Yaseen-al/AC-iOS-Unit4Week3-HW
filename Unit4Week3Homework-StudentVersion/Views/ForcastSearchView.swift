//
//  forcastSearchView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/7/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class ForcastSearchView: UIView {
    var zipCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your Zip Code"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        //backgroundColor
        label.backgroundColor = UIColor.gray
        return label
    }()
    var searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        return textField
    }()
    var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather of New York"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        //backgroundColor
        label.backgroundColor = UIColor.gray
        return label
    }()
    lazy var collectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cView.backgroundColor = .orange
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
//        setupCollectioView()
//        setupCityLabel()
//        setupSearchTextField()
        setupZipCodeLabel()
    }
    private func setupCityLabel(){
        //TODO add the constraints
        addSubview(cityLabel)
    }
    private func setupCollectioView(){
        //TODO add the constraints
        addSubview(collectioView)
    }
    private func setupSearchTextField(){
        //TODO add the constraints
        addSubview(searchTextField)
    }
    private func setupZipCodeLabel(){
        //TODO add the constraints
        addSubview(zipCodeLabel)
        zipCodeLabel.allowsDefaultTighteningForTruncation = false
        zipCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        zipCodeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        zipCodeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45).isActive = true
    }
}

