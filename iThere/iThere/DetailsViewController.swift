//
//  DetailsViewController.swift
//  iThere
//
//  Created by Rod Johnson on 6/12/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var currentBeaconInfo : BeaconInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = currentBeaconInfo!.uuid
        
        // Do any additional setup after loading the view.
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
