//
//  ProblemDetailTableViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/15/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class ProblemDetailTableViewController: UITableViewController, CusTVReloadDelegate {

    var curProblem: Problem!
    var solutions: [String]! {
        didSet {
            tableView.reloadData()
        }
    }
    
    var contentHeights = [Int: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 200
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // 0 for title, 1 for description, 2 for solutions
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 2 {
            return curProblem.solutions.count
        } else {
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName: String
        switch section {
        case 0:
            sectionName = "TITLE"
            break;
        case 1:
            sectionName = "DESCRIPTION"
            break;
        case 2:
            sectionName = "SOLUTIONS"
            break;
        default:
            sectionName = "WHAT HAPPENED"
        }
        return sectionName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // CusTVReloadDelegate - required
    func reloadTableView(indexPath: IndexPath, height: CGFloat) {
        //tableView.reloadData()
        contentHeights[indexPath.row] = height
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 1 {
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
