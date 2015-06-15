//
//  BeaconListViewController.swift
//  iThere
//
//  Created by Rod Johnson on 6/12/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import UIKit

class BeaconListViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var beacons = [BeaconInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Customers"
       self.setupBeacons()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupBeacons(){
        var newBeacon = BeaconInfo(uuid:"asdf1",accountNumber:"1234123",age:22,gender:1,distance:4.024,payload:123)
        beacons.append(newBeacon)
        newBeacon = BeaconInfo(uuid:"asdf2",accountNumber:"1234123",age:22,gender:1,distance:4.024,payload:123)
        beacons.append(newBeacon)
        newBeacon = BeaconInfo(uuid:"asdf3",accountNumber:"1234123",age:22,gender:1,distance:4.024,payload:123)
        beacons.append(newBeacon)
        newBeacon = BeaconInfo(uuid:"asdf4",accountNumber:"1234123",age:22,gender:1,distance:4.024,payload:123)
        beacons.append(newBeacon)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return beacons.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : BeaconTableViewCell = tableView.dequeueReusableCellWithIdentifier("beaconCell") as! BeaconTableViewCell
        
        let beacon = beacons[indexPath.row];
        cell.accountLabel.text = beacon.accountNumber
        cell.distanceLabel.text = "1.0"
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        var nextView = segue.destinationViewController as! DetailsViewController
        if let indexPath = self.myTableView.indexPathForSelectedRow(){
            let selectedBeacon = beacons[indexPath.row]
            nextView.currentBeaconInfo = selectedBeacon
        }
    }

}
