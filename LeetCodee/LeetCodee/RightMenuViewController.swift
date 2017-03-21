//
//  RightMenuViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/20/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class RightMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: UpdateDataDelegate!
    
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
        return 6
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
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SendFeedbackTVCell") as! SendFeedbackTVCell
            cell.label.text = "Update With Online Database"
            cell.label.textColor = .red
            return cell
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
        } else if indexPath.row == 5 {
            let updateVC = storyboard?.instantiateViewController(withIdentifier: "UpdateDataVC") as! UpdateDataViewController
            updateVC.delegate = delegate
            present(updateVC, animated: true, completion: nil)
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

