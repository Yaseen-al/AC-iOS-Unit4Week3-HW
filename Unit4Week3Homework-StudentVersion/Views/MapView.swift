//
//  MapView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
import MapKit
class MapView: UIView {
    lazy var myMapView:MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        setupMapView()
    }
    func setupMapView(){
        addSubview(myMapView)
        myMapView.translatesAutoresizingMaskIntoConstraints = false
        myMapView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        myMapView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myMapView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        myMapView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        
    }
}
