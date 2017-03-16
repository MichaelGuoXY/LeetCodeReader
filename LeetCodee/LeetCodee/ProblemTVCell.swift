//
//  ProblemTVCell.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/14/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class ProblemTVCell: UITableViewCell {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var acceptance: UILabel!
    @IBOutlet weak var difficulty: UILabel!

    var problem: Problem! {
        didSet {
            updateUI()
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
    
    func updateUI() {
        // update UI immediately after "problem" being set
        id.text = "No." + String(problem.id)
        title.text = problem.title
        acceptance.text = "acceptance: " + String(problem.acceptance) + "%"
        difficulty.text = "difficulty: " + problem.difficulty
    }

}
