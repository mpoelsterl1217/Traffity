//
//  FirstViewController.swift
//  Traffity
//
//  Created by Matthew Poelsterl on 3/14/19.
//  Copyright © 2019 Matthew Poelsterl. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        instructionLabel.text = "When you start a drive: \n -Place your phone with the screen up \n -Face the top of your phone to the front of your car \n - Buckle your seat belt and get driving"
    }
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var accelYTag: UILabel!
    @IBOutlet weak var EventOccuringLabel: UILabel!
    
    var processor = AcclerationProcessor()
    @IBAction func startTrip(_ sender: UIButton) {
        processor.startAccelerometer(yLabel: accelYTag, eventLabel: EventOccuringLabel)
    }
    @IBAction func endTrip(_ sender: UIButton) {
        processor.stopAccelerometer()
    }
    
}

