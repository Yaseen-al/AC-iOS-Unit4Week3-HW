//
//  MapViewController.swift
//  Unit4Week3Homework-StudentVersion
//resources are from youtube tutorials on swift 2 and others
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
import MapKit
class MapViewController: UIViewController,UISearchBarDelegate {
    let mapView = MapView()
    override func viewDidLoad() {
        self.view.backgroundColor = .orange
        self.view.addSubview(mapView)
        configureBarItem()
    }
    func configureBarItem(){
        let searchBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(search))
        navigationItem.rightBarButtonItem = searchBarButtonItem
    }
    @objc func search() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // this is to ignore the usere
        UIApplication.shared.beginIgnoringInteractionEvents()
        // Activity Indicator Intialization
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        // this is to center the activityIndicator in the center
        activityIndicator.center = self.view.center
        // this will hide the activity indicator when it is stopped
        activityIndicator.hidesWhenStopped = true
        // this is to treger the activity indicator
        activityIndicator.startAnimating()
        // this is to add the activity to the main view subView
        
        
        self.view.addSubview(activityIndicator)
        //hide searchBar keyboard
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //create the search Request
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text // this is will assign the searchBar text to the searchRequest
        // start the search based on searchRequest
        let activeSearch = MKLocalSearch(request: searchRequest)
        //
        activeSearch.start { (response, error) in
            // stop indicator animation
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            guard let response = response else{
                print("Error finding the item")
                return
            }
            // remove the annotations this will allow you to remove all the markers on the map
            let annotations = self.mapView.myMapView.annotations
            // this will remove all the annotation, note that the function takes an array of MKAnnotation
            self.mapView.myMapView.removeAnnotations(annotations)
            
            // getting the data
            let latitude = response.boundingRegion.center.latitude
            let longitude = response.boundingRegion.center.longitude
            // create the annotation based on the lattitude and longitude
            let annotation = MKPointAnnotation()
            // create a title for the annotation
            annotation.title = searchBar.text
            // add the cordinates to the annotation by adding a cordinate to it
            annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            self.mapView.myMapView.addAnnotation(annotation)
            //zooming  on annotaion
            //make a cordinate
            let cordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            //make a span which set the extent
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(cordinate, span)
            // take the cordinate of the annotation and created a span which means how much you want to zoom in and you mix it up with the cordinates to move to the desired point which will give you the region and then you will set the region to the mapeView
            self.mapView.myMapView.setRegion(region, animated: true)
        }
        
        
    }
    
    
}









