//
//  RightMenuViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/20/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class RightMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeTVCell") as! WelcomeTVCell
            cell.titleLabel.text = "Coming Soon"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeTVCell") as! WelcomeTVCell
            cell.titleLabel.text = "..."
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeTVCell") as! WelcomeTVCell
            cell.titleLabel.text = ""
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SendFeedbackTVCell") as! SendFeedbackTVCell
            cell.label.text = "Send Feedback"
            return cell
//        case 4:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTVCell") as! OptionOneTableViewCell
//            cell.imgView.image = #imageLiteral(resourceName: "HtoE")
//            cell.titleLabel.text = "Sort by Problem Acceptance and Difficulty"
//            return cell
//        case 5:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTVCell") as! OptionOneTableViewCell
//            cell.imgView.image = #imageLiteral(resourceName: "ZtoA")
//            cell.titleLabel.text = "Sort by Problem Title"
//            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            let sendFeedbackVC = storyboard?.instantiateViewController(withIdentifier: "SendFeedbackVC") as! SendFeedbackViewController
            present(sendFeedbackVC, animated: true, completion: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //        tableView.cellForRow(at: indexPath)?.backgroundColor = tableView.backgroundColor
    //    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

