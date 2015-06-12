//
//  ViewController.swift
//  iHere
//
//  Created by Nathan Larson on 6/11/15.
//  Copyright (c) 2015 Nathan Larson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    var alreadyViewed:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if (alreadyViewed) {
            
        }else {
            alreadyViewed = true
            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("EnterInformation") as! EnterInformation
            
            self.presentViewController(vc, animated: true, completion: nil)
            // self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StartAction(sender: AnyObject) {
        
        let vc2 = self.storyboard!.instantiateViewControllerWithIdentifier("StartStop") as! StartStop
        
        self.navigationController?.pushViewController(vc2, animated: true)
    }

}

