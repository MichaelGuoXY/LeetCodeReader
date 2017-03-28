//
//  NightModeTableViewCell.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/28/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class NightModeTableViewCell: UITableViewCell {
    var delegate: NightModeTVCellDelegate!
    var delegateII: NightModeTVCellDelegateII!
    let userDefault = UserDefaults.standard
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func nightModeSwitched(_ sender: UISwitch) {
        if sender.isOn {
            // night mode on
            userDefault.set(20/255.0, forKey: "red")
            userDefault.set(20/255.0, forKey: "green")
            userDefault.set(20/255.0, forKey: "blue")
            userDefault.set(true, forKey: "isNight")
            delegate.reloadHomeViewForColor()
            delegateII.reloadRightMenuTableView()
        } else {
            // night mode off
            userDefault.set(85/255.0, forKey: "red")
            userDefault.set(210/255.0, forKey: "green")
            userDefault.set(251/255.0, forKey: "blue")
            userDefault.set(false, forKey: "isNight")
            delegate.reloadHomeViewForColor()
            delegateII.reloadRightMenuTableView()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol NightModeTVCellDelegate {
    func reloadHomeViewForColor()
}

protocol NightModeTVCellDelegateII {
    func reloadRightMenuTableView()
}
