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
//    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var firstNutImgView: UIImageView!
    @IBOutlet weak var secondNutImgView: UIImageView!
    @IBOutlet weak var thirdNutImgView: UIImageView!

    var problem: Problem! {
        didSet {
            updateUI()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let startPoint = CGPoint(x: 0.0, y: frame.size.height)
        let endPoint = CGPoint(x: CGFloat(Float(frame.width) * problem.acceptance / 100.0), y: frame.size.height)
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor(red: 17/255, green: 246/255, blue: 139/255, alpha: 1.0).cgColor
        shapeLayer.lineWidth = 2.5
        
        layer.addSublayer(shapeLayer)
        
        super.draw(rect)
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
        acceptance.text = String(format: "%.2f", problem.acceptance) + "%"
        switch problem.difficulty {
        case "Easy":
            firstNutImgView.image = #imageLiteral(resourceName: "difficultyIcon2")
            secondNutImgView.image = #imageLiteral(resourceName: "difficultyIcon2")
            break
        case "Medium":
            firstNutImgView.image = #imageLiteral(resourceName: "difficultyIcon2")
            secondNutImgView.image = #imageLiteral(resourceName: "difficultyIcon")
            break
        default:
            firstNutImgView.image = #imageLiteral(resourceName: "difficultyIcon")
            secondNutImgView.image = #imageLiteral(resourceName: "difficultyIcon")
        }
    }
}
