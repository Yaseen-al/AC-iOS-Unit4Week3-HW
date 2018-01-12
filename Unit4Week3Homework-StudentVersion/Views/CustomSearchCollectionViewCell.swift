//
//  CustomSearchCollectionViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/7/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
class CustomSearchCollectionViewCell: UICollectionViewCell {
    let lowTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.layer.shadowOpacity = 0.45
        label.text = "Low: 65 ° F"
        return label
    }()
    let highTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.layer.shadowOpacity = 0.45
        label.text = "High: 70 ° F"
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.layer.shadowOpacity = 0.45
        label.text = "2018 - 1 - 1"
        return label
    }()
    let conditionImage: UIImageView = {
        var image = UIImageView()
        image.image = #imageLiteral(resourceName: "sunny")
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        setupDataLabel()
        setupConditionImage()
        setupHighTempLabel()
        setuplowTempLabel()
    }
    func setupDataLabel() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    func setupConditionImage() {
        addSubview(conditionImage)
        conditionImage.translatesAutoresizingMaskIntoConstraints = false
        conditionImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        conditionImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        conditionImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        conditionImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45).isActive = true
        
    }
    func setupHighTempLabel() {
        addSubview(highTempLabel)
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        highTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        highTempLabel.topAnchor.constraint(equalTo: conditionImage.bottomAnchor, constant: 5).isActive = true
    }
    func setuplowTempLabel() {
        addSubview(lowTempLabel)
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        lowTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lowTempLabel.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor, constant: 5).isActive = true
    }
}
