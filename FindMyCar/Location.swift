//
//  Location.swift
//  FindMyCar
//
//  Created by Glen Wise on 10/12/16.
//  Copyright © 2016 FishbulbApps. All rights reserved.
//

import Foundation
import CoreLocation

class Location: NSObject, NSCoding {
//    var dataManager = DataManager()
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    var locationManager = CLLocationManager()
    
    override init() {
        self.latitude = 0.0
        self.longitude = 0.0
        super.init()
    }
    
    func getCurrentLocation() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        if let currLocation = locationManager.location {
            self.latitude = currLocation.coordinate.latitude
            self.longitude = currLocation.coordinate.longitude
//            dataManager.latitude = latitude
//            dataManager.longitude = longitude
//            dataManager.saveLocations()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.latitude = aDecoder.decodeDoubleForKey("Latitude") as! CLLocationDegrees
        self.longitude = aDecoder.decodeDoubleForKey("Longitude") as! CLLocationDegrees
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeDouble(latitude, forKey: "Latitude")
        aCoder.encodeDouble(longitude, forKey: "Longitude")
    }
}