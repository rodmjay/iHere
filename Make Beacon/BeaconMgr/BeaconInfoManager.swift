//
//  BluetoothInfoManager.swift
//  BeaconMgr
//
//  Created by Rod Johnson on 6/14/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class BeaconInfoManager : NSObject, CLLocationManagerDelegate, CBPeripheralManagerDelegate {
    
    static var beacons = [BeaconInfo]()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "12341234-1234-1234-1234-123412341234"), identifier: "Macu")
    let peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: options)
    
    var peripheralManager:CBPeripheralManager
    var region:CLBeaconRegion
    var power:Float = 0.0
    
    var enabled:Bool = false
    var uuid:NSUUID
    var major:Int16 = 0
    var minor:Int16 = 0
    
    override init() {
        
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
    
    
    class func ScanBeacons(){
        if(beacons.count == 0){
            SetupDummyBeacons()
        }
    }
    
    class func SetupDummyBeacons(){
        var newBeacon = BeaconInfo(uuid: "123-1234", distance: 1.0, major: 1, minor: 2)
        beacons.append(newBeacon);
        
        newBeacon = BeaconInfo(uuid: "123-5678", distance: 1.2, major: 2, minor: 2)
        beacons.append(newBeacon);
        
        newBeacon = BeaconInfo(uuid: "345-1234", distance: 1.3, major: 3, minor: 2)
        beacons.append(newBeacon);
        
        newBeacon = BeaconInfo(uuid: "456-5678", distance: 1.5, major: 4, minor: 2)
        beacons.append(newBeacon);
    }
    
    class func StartBeacon(uuid: String, major: Int, minor: Int){
        
    }
    
    class func StopBeacon(){
        
    }
    
}
