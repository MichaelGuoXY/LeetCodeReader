//
//  ProblemDetailViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/17/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class ProblemDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SolutionReloadDelegate, ReloadDescriptionCellDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backToTopBtn: UIButton!
    
    var curProblem: Problem!
    var solutions: [String]! {
        didSet {
            tableView.reloadData()
        }
    }
    
    var heightsForSolutionsCell = [IndexPath: [Any]]()
    var heightForDescriptionCell: CGFloat!
    
    let sectionTitleArr = ["TITLE", "DESCRIPTION", "SOLUTIONS"]
    let userDefault = UserDefaults.standard
    
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
        
        // navi bar right button config
        let rightBarBtnItem = UIBarButtonItem(title: "My Submissions", style: .plain, target: self, action: #selector(naviToMySubmissions(sender:)))
        navigationItem.rightBarButtonItem = rightBarBtnItem
    }
    
    func naviToMySubmissions(sender: UIBarButtonItem) {
        let mySubmissionsVC = storyboard?.instantiateViewController(withIdentifier: "LoginLeetcodeVC") as! LoginLeetcodeViewController
        mySubmissionsVC.url = URL(string: curProblem.problemLink + "/#/submissions")
        mySubmissionsVC.isLogin = false
        present(mySubmissionsVC, animated: true, completion: nil)
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
        self.view.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
//        tabBarController?.tabBar.barTintColor = UIColor(red: 85/255, green: 210/255, blue: 251/255, alpha: 0.9)
        tableView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        fetchSolutions()
    }
    
    func fetchSolutions() {
        var solus = [String]()
        for solution in curProblem.solutions {
            solus.append(solution.stringValue)
        }
        solutions = solus
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
            cell.contentView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTVCell", for: indexPath) as! DescriptionTVCell
            cell.descriptionOfProblem = curProblem.descriptionn
            cell.delegate = self
            cell.indexPath = indexPath
            cell.contentView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SolutionTVCell", for: indexPath) as! SolutionsTVCell
            cell.solutionOfProblem = solutions == nil ? "" : solutions[indexPath.row]
            cell.delegate = self
            cell.indexPath = indexPath
            cell.contentView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
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
        returnedView.backgroundColor = UIColor(red: 241/255, green: 232/255, blue: 215/255, alpha: 1.0)
        
        let label = UILabel(frame: CGRect(x: returnedView.bounds.width / 5, y: 0, width: tableView.bounds.width, height: 30))
        label.text = sectionTitleArr[section]
        label.textColor = .gray
        label.font = UIFont(name: userDefault.string(forKey: "ProblemDetailViewHeaderTextFont")!, size: 20)
        returnedView.addSubview(label)
        
        // section == 0: TITLE
        let returnedViewS1 = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
        returnedView.frame = CGRect(x: 0, y: 10, width: tableView.bounds.width, height: 30)
        returnedViewS1.addSubview(returnedView)
        return returnedViewS1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section < 2 {return}
        let isUnExpanded = heightsForSolutionsCell[indexPath]?[0] as! Int == 1
        heightsForSolutionsCell[indexPath]?[0] = isUnExpanded ? 2 : 1
        tableView.cellForRow(at: indexPath)?.backgroundColor = isUnExpanded ? UIColor(red: 255/255, green: 217/255, blue: 255/255, alpha: 1) : .white
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    // MARK: - CusTVReloadDelegate
    func passHeightToTableView(indexPath: IndexPath, height_title: CGFloat, height_full: CGFloat) {
        if heightsForSolutionsCell[indexPath] == nil {
            heightsForSolutionsCell[indexPath] = [1, height_title, height_full]
            tableView.reloadData()
        }
    }
    
    // MARK: - ReloadDescriptionCellDelegate
    func reloadDescriptionCell(indexPath: IndexPath, height: CGFloat) {
        //tableView.beginUpdates()
        if heightForDescriptionCell == nil {
            heightForDescriptionCell = height
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        //tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else if indexPath.section == 1 { // description section
            return heightForDescriptionCell == nil ? 100 : heightForDescriptionCell > view.frame.height * 3/5 ? view.frame.height * 3/5 : heightForDescriptionCell
        } else if indexPath.section == 2{ // solutions section
            if heightsForSolutionsCell[indexPath] == nil {
                return 400
            } else {
                let index = heightsForSolutionsCell[indexPath]?[0] as! Int
                if (heightsForSolutionsCell[indexPath]![index] as! CGFloat) < view.frame.height * 3/5 {
                    return heightsForSolutionsCell[indexPath]![index] as! CGFloat
                } else {
                    return view.frame.height * 3/5
                }
            }
        } else {
            return 0
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            heightForDescriptionCell = nil
            heightsForSolutionsCell = [IndexPath: [CGFloat]]()
            tableView.reloadData()
        } else {
            heightForDescriptionCell = nil
            heightsForSolutionsCell = [IndexPath: [CGFloat]]()
            tableView.reloadData()
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
