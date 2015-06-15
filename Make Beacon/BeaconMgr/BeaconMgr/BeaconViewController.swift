//
//  BeaconViewController.swift
//  BeaconMgr
//
//  Created by Rod Johnson on 6/14/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import UIKit

class BeaconViewController: UIViewController {

    var beacon : BeaconInfo?
    
    @IBOutlet weak var minorLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var uuidLabel: UILabel!
    
    @IBOutlet weak var acctLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = beacon?.uuid
        
        minorLabel.text = String( beacon!.minor)
        majorLabel.text = String( beacon!.major)
        uuidLabel.text = String( beacon!.uuid)
        // Do any additional setup after loading the view.
        
        var acct = AccountManager.GetAccount(beacon!.major)
        acctLabel.text = String( acct.accountId);
        firstNameLabel.text = acct.firstName
        lastNameLabel.text = acct.lastName
        
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
