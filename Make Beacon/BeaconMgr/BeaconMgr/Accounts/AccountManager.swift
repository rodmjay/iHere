//
//  AccountManager.swift
//  BeaconMgr
//
//  Created by Rod Johnson on 6/14/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import UIKit

class AccountManager: NSObject {

    class func GetAccount(accountId: Int) -> AccountInfo{
        switch (accountId){
        case 1:
                return AccountInfo(accountId: 1, firstName: "Rod", lastName: "Johnson")
        case 2:
                return AccountInfo(accountId: 2, firstName: "Jon", lastName: "Smith")
        case 3:
                return AccountInfo(accountId: 3, firstName: "Waynard", lastName: "Schmidt")
            default:
                return AccountInfo(accountId: 4, firstName: "Steve", lastName: "Harvey")
        }
    }
    
}
