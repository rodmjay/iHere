//
//  StartStop.swift
//  iHere
//
//  Created by Nathan Larson on 6/11/15.
//  Copyright (c) 2015 Nathan Larson. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class StartStop: UIViewController, CBPeripheralManagerDelegate {
    
    var peripheralManager:CBPeripheralManager
    var region:CLBeaconRegion
    var power:Float = 0.0
    
    var enabled:Bool = false
    var uuid:NSUUID
    var major:Int16 = 0
    var minor:Int16 = 0
    
    
    
    init() {
        
        uuid = NSUUID(UUIDString: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6")
        major = 1234567891234567
        minor = 1234567891234567
        
        if (!peripheralManager)
        {
            peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: options)
        }
        else
        {
            peripheralManager.delegate = self;
        }

        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true

        self.startBeacon()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startBeacon() {
     
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("userInfo")
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        
        println(resultDictionary)
        
        
        
            // We must construct a CLBeaconRegion that represents the payload we want the device to beacon.
            NSDictionary *peripheralData = nil;
        
            region = CLBeaconRegion(proximityUUID: uuid, major: major, minor: minor, identifier: "string")
                
                [[CLBeaconRegion alloc] initWithProximityUUID:self.uuid major:[self.major shortValue] minor:[self.minor shortValue] identifier:BeaconIdentifier];
            peripheralData = [region peripheralDataWithMeasuredPower:power];
        
            // The region's peripheral data contains the CoreBluetooth-specific data we need to advertise.
            if(peripheralData)
            {
                [peripheralManager startAdvertising:peripheralData];
            }
        

    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        
        peripheralManager.delegate = nil;
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    
}
