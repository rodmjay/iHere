//
//  BeaconInfo.swift
//  BeaconMgr
//
//  Created by Rod Johnson on 6/14/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import UIKit

class BeaconInfo: NSObject {
    var uuid : String
    var distance : Float
    var major : Int
    var minor : Int
    
    init(uuid : String, distance : Float, major : Int, minor : Int){
        self.uuid = uuid;
        self.distance = distance;
        self.major = major;
        self.minor = minor;
    }
    
    func getDistanceString () -> String{
        return NSString(format: "%.2f",self.distance) as String
    }
}
