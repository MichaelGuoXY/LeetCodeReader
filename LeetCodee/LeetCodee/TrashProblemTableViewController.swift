//
//  TrashProblemTableViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/27/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import RealmSwift

class TrashProblemTableViewController: UITableViewController, MGSwipeTableCellDelegate, UIViewControllerPreviewingDelegate {
    
    var problems: [Problem]!
    let realm = try! Realm()
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        self.title = "Trash"
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        
        // Check Force touch Capability
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            // register UIViewControllerPreviewingDelegate to enable Peek & Pop
            registerForPreviewing(with: self, sourceView: view)
        } else {
            // 3D Touch Unavailable : present alertController or
            // Provide alternatives such as touch and hold..
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // config nav bar color
        navigationController?.navigationBar.barTintColor = tabBarController?.tabBar.barTintColor
        navigationController?.navigationBar.tintColor = .white
        
        // tab bar color
        //        tabBarController?.tabBar.barTintColor = userDefault.object(forKey: "BarTintColor") as? UIColor
        tabBarController?.tabBar.tintColor = .white
        tableView.tintColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        tableView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        // reload problems to be displayed
        problems = [Problem]()
        for problem in realm.objects(Problem.self).filter("isTrashed == true").sorted(byKeyPath: "id") {
            problems.append(problem)
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return problems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProblemTVCell", for: indexPath) as! ProblemTVCell
        
        // Configure the cell...
        cell.problem = problems[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    // MARK: -- MGSwipeTableCellDelegate
    func swipeTableCell(_ cell: MGSwipeTableCell, swipeButtonsFor direction: MGSwipeDirection, swipeSettings: MGSwipeSettings, expansionSettings: MGSwipeExpansionSettings) -> [UIView]? {
        
        swipeSettings.transition = .static
        expansionSettings.buttonIndex = 0
        
        if direction == MGSwipeDirection.leftToRight {
            expansionSettings.fillOnTrigger = true
            expansionSettings.threshold = 1.1
            let color = UIColor.init(red:17/255.0, green:246/255.0, blue:139/255.0, alpha:1.0)
            let path = self.tableView.indexPath(for: cell)!
            
            return [
                MGSwipeButton(title: "  Un-Trash it", icon: #imageLiteral(resourceName: "recycle"), backgroundColor: color, callback: { (cell) -> Bool in
                    let id = self.problems[path.row].id
                    for problem in self.realm.objects(Problem.self).filter("id == %@", id) {
                        try! self.realm.write {
                            problem.isTrashed = false
                        }
                    }
                    self.problems.remove(at: path.row)
                    self.tableView.deleteRows(at: [path], with: .fade)
                    
                    return false //don't autohide to improve delete animation
                })
            ]
        }
        else {
            expansionSettings.fillOnTrigger = false
            expansionSettings.threshold = 1.1
            //let padding = 15
            let color = UIColor(red: 179/255, green: 136/255, blue: 250/255, alpha: 1.0)
            let path = self.tableView.indexPath(for: cell)!
            let problemCell = cell as! ProblemTVCell
            let curLike = problemCell.problem.isFavorite
            return [
                MGSwipeButton(title: readFavoriteStatus(cur: curLike), icon: curLike ? #imageLiteral(resourceName: "dislike") : #imageLiteral(resourceName: "like"), backgroundColor: color, callback: { (cell) -> Bool in
                    let id = self.problems[path.row].id
                    for problem in self.realm.objects(Problem.self).filter("id == %@", id) {
                        try! self.realm.write {
                            problem.isFavorite = !problem.isFavorite
                        }
                    }
                    //problemCell.problem.isFavorite = !(problemCell.problem.isFavorite)
                    problemCell.toggleFavorite()
                    problemCell.refreshContentView()
                    (cell.rightButtons[0] as! UIButton).setTitle(self.readFavoriteStatus(cur: problemCell.problem.isFavorite), for: .normal)
                    (cell.rightButtons[0] as! UIButton).setImage(problemCell.problem.isFavorite ? #imageLiteral(resourceName: "dislike") : #imageLiteral(resourceName: "like"), for: .normal)
                    return true
                })
            ]
        }
    }
    
    func readFavoriteStatus(cur: Bool) -> String {
        if cur == true { // cur is favorite
            return "  Mark as unfavorite"
        } else {
            return "  Mark as favorite"
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            print("Deleted")
    //
    ////            self.catNames.remove(at: indexPath.row)
    //            self.tableView.deleteRows(at: [indexPath], with: .automatic)
    //        }
    //    }
    
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
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowProblemDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                var problem: Problem
                problem = problems[indexPath.row]
                let destController = segue.destination as! ProblemDetailViewController
                destController.curProblem = problem
            }
        }
    }
    
    // MARK: - 3D Touch Implementation
    
    /// Called when the user has pressed a source view in a previewing view controller (Peek).
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        // Get indexPath for location (CGPoint) + cell (for sourceRect)
        guard let indexPath = tableView.indexPathForRow(at: location),
            let cell = tableView.cellForRow(at: indexPath) else { return nil }
        
        // Instantiate VC with Identifier (Storyboard ID)
        guard let previewViewController = storyboard?.instantiateViewController(withIdentifier: "ProblemDetailVC") as? ProblemDetailViewController else { return nil }
        
        previewViewController.curProblem = problems[indexPath.row]
        
        // Current context Source.
        previewingContext.sourceRect = cell.frame
        
        return previewViewController
    }
    /// Called to let you prepare the presentation of a commit (Pop).
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        // Presents viewControllerToCommit in a primary context
        show(viewControllerToCommit, sender: self)
    }
    
}
