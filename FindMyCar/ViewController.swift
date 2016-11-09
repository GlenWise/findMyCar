//
//  ViewController.swift
//  FindMyCar
//
//  Created by Glen Wise on 10/12/16.
//  Copyright © 2016 FishbulbApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.loadLocations()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let location = Location()
   // var locations = [Location]()
    var dataManager = DataManager()
    
    @IBAction func saveLocation(sender: AnyObject) {
        //dataManager.clearCarLocation()
        self.location.getCurrentLocation()
        
        let alert = UIAlertController(title: "Location Set!", message: generateMessage(), preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aight", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        dataManager.saveLocations()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "wheresMyCar" {
            let mapVC = segue.destinationViewController as! MapViewController
            mapVC.location = location
        }
    }
    
    func generateMessage() -> String {
        let message = "Your car is currently at: \n( \(location.latitude), \(location.longitude) )\n\nWhen you want a map to this location, simply press the 'Where is my car?' button."
        return message
    }
}

