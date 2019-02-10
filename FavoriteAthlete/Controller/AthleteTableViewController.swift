//
//  AthleteTableViewController.swift
//  FavoriteAthlete
//
//  Created by Hameed Abdullah on 2/5/19.
//  Copyright © 2019 Hameed Abdullah. All rights reserved.
//

import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }
    
    var athletes: [Athlete] = [Athlete]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete: Athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //First cast the segue's destination view controller as an AthleteFormViewController.
        guard let athleteFormViewController: AthleteFormViewController = segue.destination as? AthleteFormViewController else {
            print("prepare(for:sender:) destination was not AthleteFormViewController")
            return
        }
        
        
        //Athlete objects are stored in an array called athletes in the table view controller. The index of each athlete in the array corresponds to the index of the table cell displaying the same athlete. That means you can use tableView.indexPathForSelectedRow to get the index path of the selected cell, then use that path to retrieve the right Athlete object from the athletes array
        //The index path returned is optional, so you'll need to unwrap it.
        guard let indexPath: IndexPath = tableView.indexPathForSelectedRow else {
            print("prepare(for:sender:) could not get IndexPath")
            return
        }
        
        
         //check that the segue's identifier is "EditAthlete." If it is, assign the right athlete to the destination view controller's athlete property.
        guard segue.identifier == PropertyKeys.editAthleteSegue else {
            print("prepare(for:sender:) segue.identifier was not editAthleteSegue")
            return
        }
        
        athleteFormViewController.athlete = athletes[indexPath.row]
    }
    
    
    
    
    //Next, you'll enable the table view controller to receive an Athlete object back from the AthleteFormViewController—in the event that a new athlete has been added or an existing athlete has been edited. You'll do this with an unwind segue.
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        guard let athleteFormViewController: AthleteFormViewController = unwindSegue.source as? AthleteFormViewController else {
            print("unwind: source was not AthleteFormViewController")
            return
        }
        
        guard let athlete: Athlete = athleteFormViewController.athlete else {
            print("unwind did not receive athlete")
            return
        }
        
        if let indexPath: IndexPath = tableView.indexPathForSelectedRow {
            athletes.remove(at: indexPath.row)
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            athletes.append(athlete)
        }
        
    }
    
    
    
    
    
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
