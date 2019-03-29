//
//  TripTableViewController.swift
//  Traffity
//
//  Created by Matthew Poelsterl on 3/25/19.
//  Copyright © 2019 Matthew Poelsterl. All rights reserved.
//

import UIKit

class TripTableViewController: UITableViewController {
    
    
    //MARK: Properties
    var trips = [Trip]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let savedTrips = loadTrips() {
            trips += savedTrips
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trips.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TripTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TripTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TripTableViewCell.")
        }
        // Configure the cell...
        let trip = trips[indexPath.row]
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US")
        cell.dateLabel.text = f.string(from: trip.date) /*+ " \(Calendar.current.component(.hour, from: trip.date))" + ":\(Calendar.current.component(.minute, from: trip.date))"*/
        cell.ratingLabel.text = String(trip.score)
        cell.harshAccelLabel.text = "foo"/*String(trip.harshAccel)*/
        cell.harshBrakeLabel.text = "bar"/*String(trip.harshBrakes)*/
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Functions
    func saveTrips(trip: Trip) {
        trips.append(trip)
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(trips, toFile: Trip.ArchiveURL.path)
        
    }
    func loadTrips() -> [Trip]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Trip.ArchiveURL.path) as? [Trip]
    }
}
