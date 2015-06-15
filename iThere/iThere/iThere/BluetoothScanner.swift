//
//  BluetoothScanner.swift
//  iThere
//
//  Created by Rod Johnson on 6/13/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//


class BluetoothScanner {
    init(uuids:[String]){
        for uuid in uuids{
            println(uuid)
        }
    }
    
    class func StartScanning(){
        println("scanning...")
    }
}
