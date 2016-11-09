//
//  DataManager.swift
//  ContactsLite
//

import Foundation
import CoreLocation
// MARK: - String Extension

extension String {
    // recreating a function that String class no longer supports in Swift 2.3
    // but still exists in the NSString class. (This trick is useful in other
    // contexts as well when moving between NS classes and Swift counterparts.)
    
    /**
     Returns a new string made by appending to the receiver a given string.  In this case, a new string made by appending 'aPath' to the receiver, preceded if necessary by a path separator.
     
     - parameter aPath: The path component to append to the receiver. (String)
     
     - returns: A new string made by appending 'aPath' to the receiver, preceded if necessary by a path separator. (String)
     
     */
    func stringByAppendingPathComponent(aPath: String) -> String {
        let nsSt = self as NSString
        return nsSt.stringByAppendingPathComponent(aPath)
    }
}


// MARK: - Data Manager Class
class DataManager {
    
    // MARK: - General
    var latitude: CLLocationDegrees = 0.0
    var longitude: CLLocationDegrees = 0.0
    var carLocation = Location()
    
    init() {
        loadLocations()
        print("Documents folder is \(documentsDirectory())\n")
        print("Data file path is \(dataFilePath())")
    }
    
    
    // MARK: - Data Location Methods
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().stringByAppendingPathComponent("Locations.plist")
    }
    
    
    // MARK: - Saving & Loading Data
    
    /**
     Saves location data to a plist.
     */
    
    func saveLocations() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
//        archiver.encodeObject(carLocation, forKey: "Latitude")
//        archiver.encodeObject(carLocation, forKey: "Longitude")
        archiver.encodeObject(carLocation, forKey: "Location")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    /**
     Loads the data from a plist into contacts array.
     */
    
    func loadLocations() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
//                self.latitude = unarchiver.decodeObjectForKey("Latitude") as! CLLocationDegrees
//                self.longitude = unarchiver.decodeObjectForKey("Longitude") as! CLLocationDegrees
                self.carLocation = unarchiver.decodeObjectForKey("Location") as! Location
                unarchiver.finishDecoding()
            } else {
                print("\nFILE NOT FOUND AT: \(path)")
            }
        }
    }
    
    func clearCarLocation() {
        self.latitude = 0.0
        self.longitude = 0.0
    }
}