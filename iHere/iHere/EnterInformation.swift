
//
//  EnterInformation.swift
//  iHere
//
//  Created by Nathan Larson on 6/11/15.
//  Copyright (c) 2015 Nathan Larson. All rights reserved.
//

import UIKit

class EnterInformation: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var genderOutlet: UISegmentedControl!
    @IBOutlet weak var birthdateTextField: UITextField!
    var userInfo: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //view.backgroundColor = UIColor.redColor()
        
        genderOutlet.selectedSegmentIndex = 0
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("userInfo")
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        birthdateTextField.text = resultDictionary?.valueForKey("birthdate") as! String
        
        let genderType = resultDictionary?.valueForKey("gender") as! String
        
        if (genderType == "male") {
            genderOutlet.selectedSegmentIndex = 0
        }else {
            genderOutlet.selectedSegmentIndex = 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonAction(sender: AnyObject) {
        
        userInfo.setObject(birthdateTextField.text, forKey: "birthdate")
        if (genderOutlet.selectedSegmentIndex == 1) {
            userInfo.setObject("female", forKey: "gender")
        }else {
            userInfo.setObject("male", forKey: "gender")
        }
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("userInfo")
        
        
        
        
        
        
        //var dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
        
        userInfo.writeToFile(path, atomically: false)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func genderAction(sender: AnyObject) {
        if (genderOutlet.selectedSegmentIndex == 1) {
            userInfo = ["gender":"female"]
        }else {
            userInfo = ["gender":"male"]
        }
    }
}

