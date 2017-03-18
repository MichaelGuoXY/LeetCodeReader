//
//  ProblemDetailViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/17/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class ProblemDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CusTVReloadDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backToTopBtn: UIButton!

    var curProblem: Problem!
    var solutions: [String]! {
        didSet {
            tableView.reloadData()
        }
    }
    
    var contentHeights = [Int: CGFloat]()
    
    let sectionTitleArr = ["TITLE", "DESCRIPTION", "SOLUTIONS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        backToTopBtnConfig()
        
        // got back button config
        
//        navigationController?.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!], for: UIControlState.normal)
    }
    
    // config floating button over table view
    func backToTopBtnConfig() {
        //backToTopBtn.clipsToBounds = true
        //backToTopBtn.layer.cornerRadius = backToTopBtn.bounds.width / 2
        backToTopBtn.layer.shadowColor = UIColor.black.cgColor
        backToTopBtn.layer.shadowOpacity = 1
        backToTopBtn.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        backToTopBtn.layer.shadowRadius = 10.0
    }
    
    @IBAction func backToTopBtnClicked(_ sender: UIButton) {
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        curProblem.fetchSolutions(fetch: fetchSolutions)
    }
    
    func fetchSolutions(solutions: [String]) {
        self.solutions = solutions
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // 0 for title, 1 for description, 2 for solutions
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 2 {
            return curProblem.solutions.count
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTVCell", for: indexPath) as! TitleTVCell
            cell.titleOfProblem = curProblem.title
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTVCell", for: indexPath) as! DescriptionTVCell
            cell.descriptionOfProblem = curProblem.descriptionn
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SolutionTVCell", for: indexPath) as! SolutionsTVCell
            cell.solutionOfProblem = solutions == nil ? "" : solutions[indexPath.row]
            cell.delegate = self
            cell.indexPath = indexPath
            //            cell.contentView.setNeedsLayout()
            //            cell.contentView.layoutIfNeeded()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArr[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 30))
        returnedView.layer.masksToBounds = true
        returnedView.layer.cornerRadius = 15
        returnedView.backgroundColor = .black
        
        let label = UILabel(frame: CGRect(x: returnedView.bounds.width / 5, y: 0, width: tableView.bounds.width, height: 30))
        label.text = sectionTitleArr[section]
        label.textColor = .white
        label.font = UIFont(name: "Chalkduster", size: 20)
        returnedView.addSubview(label)
        
        if section == 1 || section == 2 {
             return returnedView
        }
        
        // section == 0: TITLE
        let returnedViewS1 = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
        returnedView.frame = CGRect(x: 0, y: 10, width: tableView.bounds.width, height: 30)
        returnedViewS1.addSubview(returnedView)
        return returnedViewS1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // CusTVReloadDelegate - required
    func reloadTableView(indexPath: IndexPath, height: CGFloat) {
        //tableView.reloadData()
        contentHeights[indexPath.row] = height
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else
            if indexPath.section == 1 {
                return 300
            } else {
                return 450
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
