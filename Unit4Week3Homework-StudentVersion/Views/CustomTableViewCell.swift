//
//  CustomTableViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        // this is the where you add the reuseIdentifier
        super.init(style: style, reuseIdentifier: "savedPhotosCell")
        backgroundColor = .orange
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews(){
        setupImage()
}
    func setupImage(){
            addSubview(cellImage)
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        cellImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
    }
    
}
