//
//  AccountInfo.swift
//  BeaconMgr
//
//  Created by Rod Johnson on 6/14/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import UIKit

class AccountInfo: NSObject {
    var accountId : Int
    var firstName : String
    var lastName : String
    
    init(accountId: Int, firstName: String, lastName: String){
        self.accountId = accountId;
        self.firstName = firstName;
        self.lastName = lastName;
    }
}
