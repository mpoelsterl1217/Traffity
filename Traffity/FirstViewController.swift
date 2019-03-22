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
    }
    
    @IBOutlet weak var accelYTag: UILabel!
    @IBOutlet weak var EventOccuringLabel: UILabel!
    
    var processor = AcclerationProcessor()
    @IBAction func StateChange(_ sender: UISwitch) {
        if (sender.isOn == true){
            processor.startAccelerometer(yLabel: accelYTag, eventLabel: EventOccuringLabel)
        } else {
            processor.stopAccelerometer()
        }
    }
    
}

