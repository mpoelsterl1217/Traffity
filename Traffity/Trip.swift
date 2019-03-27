//
//  Trip.swift
//  Traffity
//
//  Created by Matthew Poelsterl on 3/20/19.
//  Copyright © 2019 Matthew Poelsterl. All rights reserved.
//

import UIKit
import os.log

class Trip: NSObject, NSCoding {
    //MARK: Initialization
    init?(date: Date, harshBrakes: Int, harshAccel: Int, score: Int) {
        
        // Initialize stored properties.
        self.date = Date()
        self.harshBrakes = harshBrakes
        self.harshAccel = harshAccel
        self.score = score
    }
    
    //MARK: Properties
    var date = Date()
    var harshBrakes = 0
    var harshAccel = 0
    var score: Int
    //Directory path for saving trips
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("trips")
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: PropertyKey.date)
        aCoder.encode(harshBrakes, forKey: PropertyKey.harshBrakes)
        aCoder.encode(harshAccel, forKey: PropertyKey.harshAccel)
        aCoder.encode(score, forKey: PropertyKey.score)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let date = aDecoder.decodeObject(forKey: PropertyKey.date)
        let harshBrakes = aDecoder.decodeInteger(forKey: PropertyKey.harshBrakes)
        let harshAccel = aDecoder.decodeInteger(forKey: PropertyKey.harshAccel)
        let score = aDecoder.decodeInteger(forKey: PropertyKey.score)
        self.init(date: date as! Date, harshBrakes: harshBrakes, harshAccel: harshAccel, score: score)
    }
    
    //MARK: Types
    struct PropertyKey {
        static let date = "date"
        static let harshBrakes = "harshBrakes"
        static let harshAccel = "harshAccel"
        static let score = "score"
    }
}
