//
//  MemberService.swift
//  iThere
//
//  Created by Rod Johnson on 6/12/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import Foundation

class MemberService{
    
    var members = [Member]()
    
    init(){
        var newMember = Member(Name : "Asdf",AccountNumber:"123-1234", ImagePath:"Some");
        members.append(newMember);
    }
    
    func getMember(userId : Int) -> Member{
        return members[0]
    }
    
}
