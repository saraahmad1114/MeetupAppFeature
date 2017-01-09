//
//  MeetupTableViewController.swift
//  MeetupFeature
//
//  Created by Flatiron School on 1/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class MeetupTableViewController: UITableViewController {
    
    let store = MeetupDataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        self.store.getMeetupInformationWith { (meetupObjectsArray) in
            print("**********************************")
            print(meetupObjectsArray)
            print("**********************************")
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
            print("********************************")
            print(self.store.meetupArray.count)
            print("********************************")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.store.meetupArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell", for: indexPath)

        if let unwrappededGroupName = self.store.meetupArray[indexPath.row].groupName{
        
        cell.textLabel?.text = unwrappededGroupName
        }
        
        if let unwrappedEventName = self.store.meetupArray[indexPath.row].eventName{
            
        cell.detailTextLabel?.text = unwrappedEventName
        }
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
