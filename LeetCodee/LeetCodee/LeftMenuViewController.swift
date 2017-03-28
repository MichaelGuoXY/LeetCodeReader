//
//  LeftMenuViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/17/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var isOneToTwo = true
    var isEToH = false
    var isAToZ = false
    var delegate: LeftMenuDelegate!
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        tableView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
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
            cell.titleLabel.text = "Welcome"
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeTVCell") as! WelcomeTVCell
            cell.titleLabel.text = "To"
            cell.backgroundColor = .clear
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeTVCell") as! WelcomeTVCell
            cell.titleLabel.text = "LeetCodee"
            cell.backgroundColor = .clear
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTVCell") as! OptionOneTableViewCell
            cell.imgView.image = #imageLiteral(resourceName: "1to2")
            cell.titleLabel.text = "Sort by Problem #"
            cell.backgroundColor = .clear
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTVCell") as! OptionOneTableViewCell
            cell.imgView.image = #imageLiteral(resourceName: "HtoE")
            cell.titleLabel.text = "Sort by Problem Acceptance and Difficulty"
            cell.backgroundColor = .clear
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTVCell") as! OptionOneTableViewCell
            cell.imgView.image = #imageLiteral(resourceName: "ZtoA")
            cell.titleLabel.text = "Sort by Problem Title"
            cell.backgroundColor = .clear
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 3 {
            return 50
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // do something on sorting
        if indexPath.row == 3 {
            isOneToTwo = !isOneToTwo
            let cell = tableView.cellForRow(at: indexPath) as! OptionOneTableViewCell
            cell.imgView.image = isOneToTwo ? #imageLiteral(resourceName: "1to2") : #imageLiteral(resourceName: "2to1")
            delegate.sortById(ascending: isOneToTwo)
        } else if indexPath.row == 4 {
            isEToH = !isEToH
            let cell = tableView.cellForRow(at: indexPath) as! OptionOneTableViewCell
            cell.imgView.image = isEToH ? #imageLiteral(resourceName: "EtoH") : #imageLiteral(resourceName: "HtoE")
            delegate.sortByAccepDiff(ascending: isEToH)
        } else if indexPath.row == 5 {
            isAToZ = !isAToZ
            let cell = tableView.cellForRow(at: indexPath) as! OptionOneTableViewCell
            cell.imgView.image = isAToZ ? #imageLiteral(resourceName: "AtoZ") : #imageLiteral(resourceName: "ZtoA")
            delegate.sortByTitle(ascending: isAToZ)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        dismiss(animated: true, completion: nil)
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

protocol LeftMenuDelegate {
    func sortById(ascending: Bool)
    func sortByAccepDiff(ascending: Bool)
    func sortByTitle(ascending: Bool)
}
