//
//  MapViewController.swift
//  FindMyCar
//
//  Created by Glen Wise on 10/12/16.
//  Copyright © 2016 FishbulbApps. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let regionRadius: CLLocationDistance = 800
    var location = Location()
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: self.location.latitude, longitude: self.location.longitude)
        centerMapOnLocation(initialLocation)
        let droppedPin = MKPointAnnotation()
        droppedPin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        droppedPin.title = "Your Car"
        mapView.addAnnotation(droppedPin)
        
        
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

