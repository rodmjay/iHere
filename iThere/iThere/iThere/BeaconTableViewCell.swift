//
//  BeaconTableViewCell.swift
//  iThere
//
//  Created by Rod Johnson on 6/12/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

import UIKit

class BeaconTableViewCell: UITableViewCell {

    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var accountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
