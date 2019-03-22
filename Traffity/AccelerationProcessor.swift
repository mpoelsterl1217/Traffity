//
//  AccelerationProcessor.swift
//  Traffity
//
//  Created by Matthew Poelsterl on 3/14/19.
//  Copyright © 2019 Matthew Poelsterl. All rights reserved.
//

import Foundation
import CoreMotion
import UIKit
class AcclerationProcessor {
    
    //CMMotionManager object
    let motion = CMMotionManager()
    
    //Define arrays that will store 10s buffer
    var accelYArray = Array(repeating: 0.0, count: 500)
    var filterPointY = 0.0
    var accelEventOccuring = false
    var brakeEventOccuring = false

    func startAccelerometer (yLabel: UILabel, eventLabel: UILabel) {
        //Create instance of Trip
        var trip = Trip(date: Date(), harshBrakes: 0, harshAccel: 0, score: 100)
        
        motion.accelerometerUpdateInterval = 0.02 //50Hz
        motion.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {
            (accelerData:CMAccelerometerData?, error: Error?) in
            if (error != nil ) {
                print("Error")
            } else {
                //filtering data point
                if (((accelerData!.acceleration.y < 0.1) && accelerData!.acceleration.y > 0) || (accelerData!.acceleration.y > 1.5) || (accelerData!.acceleration.y < -1.5)) {
                    self.filterPointY = 0.0
                } else {
                    self.filterPointY = accelerData!.acceleration.y
                }
                yLabel.text = String(format: "%.02f", self.filterPointY)
                
                //collect events from filtered point
                //collecting harsh acceleration events
                if (self.accelEventOccuring == true) {
                    if (self.filterPointY <= 0.5) {
                        //log event
                        trip!.harshAccel = trip!.harshAccel
                        self.accelEventOccuring = false
                        eventLabel.text = "--"
                    }
                } else if (self.filterPointY > 0.5) {
                    self.accelEventOccuring = true
                    eventLabel.text = "Occuring"
                }
                //collect harsh braking events
                if (self.brakeEventOccuring == true) {
                    if (self.filterPointY >= -0.5) {
                        //log event
                        trip!.harshBrakes = trip!.harshBrakes
                        self.brakeEventOccuring = false
                        eventLabel.text = "--"
                    }
                } else if (self.filterPointY < -0.5) {
                    self.brakeEventOccuring = true
                    eventLabel.text = "Occuring"
                }
                
                
            }
        })
    }
    func stopAccelerometer () {
        motion.stopAccelerometerUpdates()
        //STOP ACCELEROMETER CODE
        //save trip to permanent memory
        //let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(trips, toFile: Trip.ArchiveURL.path)
    }
    func loadTrips() -> [Trip]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Trip.ArchiveURL.path) as? [Trip]
    }
}
