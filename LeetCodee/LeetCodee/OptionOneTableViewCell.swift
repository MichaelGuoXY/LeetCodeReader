//
//  OptionOneTableViewCell.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/17/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class OptionOneTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.selectedBackgroundView?.backgroundColor = UIColor(red: 85/255, green: 210/255, blue: 251/255, alpha: 0.9)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
