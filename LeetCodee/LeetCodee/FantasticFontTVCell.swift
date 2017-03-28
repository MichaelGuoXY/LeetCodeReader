//
//  FantasticFontTVCell.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/28/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class FantasticFontTVCell: UITableViewCell {
    let userDefault = UserDefaults.standard
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            // fantastic font setting
            userDefault.set("ChalkboardSE-Bold", forKey: "SolutionTitleLabelFont")
            userDefault.set("Chalkboard SE", forKey: "TagViewCellTextLabelFont")
            userDefault.set("Papyrus", forKey: "TagViewCellDetailLabelFont")
            userDefault.set("Chalkduster", forKey: "ProblemDetailViewHeaderTextFont")
        } else {
            // normal font setting
            userDefault.set("TimesNewRomanPS-BoldMT", forKey: "SolutionTitleLabelFont")
            userDefault.set("TimesNewRomanPSMT", forKey: "TagViewCellTextLabelFont")
            userDefault.set("TimesNewRomanPSMT", forKey: "TagViewCellDetailLabelFont")
            userDefault.set("TimesNewRomanPSMT", forKey: "ProblemDetailViewHeaderTextFont")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
