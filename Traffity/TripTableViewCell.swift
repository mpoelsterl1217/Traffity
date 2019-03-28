//
//  MealTableViewCell.swift
//  Traffity
//
//  Created by Matthew Poelsterl on 3/22/19.
//  Copyright © 2019 Matthew Poelsterl. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var harshAccelLabel: UILabel!
    @IBOutlet weak var harshBrakeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
