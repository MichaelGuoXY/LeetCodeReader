//
//  TitleTVCell.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/15/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class TitleTVCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var titleOfProblem: String! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        titleLabel.text = titleOfProblem
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
