//
//  WelcomeTVCell.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/17/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class WelcomeTVCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
