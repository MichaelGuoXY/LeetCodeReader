//
//  TagSubTableViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/20/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import RealmSwift

class TagSubTableViewController: UITableViewController, CustomSearchControllerDelegate, MGSwipeTableCellDelegate {
    
    var problems = [Problem]()
    var filteredProblems = [Problem]()
    var shouldShowSearchResults = false
    var tag: String!
    var searchController: CustomSearchController!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // table view cell auto fit height
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        // configure search controller
        if UIDevice.current.orientation.isLandscape {
            let width = view.frame.width > view.frame.height ? view.frame.width : view.frame.height
            configureSearchController(width: width * 0.65)
        } else {
            let width = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
            configureSearchController(width: width * 0.65)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // reload tableview
        reloadTableView()
        navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 162/255, blue: 81/255, alpha: 0.9)
        tabBarController?.tabBar.barTintColor = UIColor(red: 255/255, green: 162/255, blue: 81/255, alpha: 0.9)
        tabBarController?.tabBar.tintColor = .white
    }
    
    func reloadTableView() {
        // get all problems from Realm
        problems = [Problem]()
        for problem in realm.objects(Problem.self).sorted(byKeyPath: "id").filter("isTrashed == false and tags contains[c] %@", tag) {
            problems.append(problem)
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            let width = view.frame.width > view.frame.height ? view.frame.width : view.frame.height
            configureSearchController(width: width * 0.65)
        } else {
            let width = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
            configureSearchController(width: width * 0.65)
        }
    }
    
    func configureSearchController(width: CGFloat) {
        // Initialize and perform a minimum configuration to the search controller.
        searchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRect(x: 0.0, y: 0.0, width: width, height: 30), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: .gray, searchBarTintColor: .white)
        //        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.customSearchBar.placeholder = "Search here..."
        //        searchController.searchBar.delegate = self
        //        searchController.searchBar.sizeToFit()
        //        searchController.searchBar.showsCancelButton = false
        let titleView = UIView(frame: searchController.customSearchBar.frame)
        titleView.addSubview(searchController.customSearchBar)
        // Place the search bar view to the tableview headerview.
        navigationItem.titleView = titleView
        //navigationItem.titleView?.tintColor = UIColor(red: 51/255, green: 210/255, blue: 236/255, alpha: 1.0)
        //navigationItem.titleView?.backgroundColor = UIColor(red: 85/255, green: 210/255, blue: 251/255, alpha: 0.9)
        //tableView.tableHeaderView = searchController.customSearchBar
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.customDelegate = self
    }

    
    // MARK: - CUstom Search Bar Delegate
    
    func didStartSearching() {
        shouldShowSearchResults = true
        tableView.reloadData()
    }
    
    
    func didTapOnCancelButton() {
        shouldShowSearchResults = false
        tableView.reloadData()
    }
    
    func didTapOnSearchButton() {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tableView.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    
    func didChangeSearchText(searchText: String) {
        // TODO filter
        filteredProblems = [Problem]()
        for problem in realm.objects(Problem.self).sorted(byKeyPath: "id").filter("tags contains[c] %@", tag).filter("title contains[c] %@ or id == %@", searchText, Int(searchText) ?? 0) {
            filteredProblems.append(problem)
            
        }
        // ...
        
        // Reload the tableview.
        tableView.reloadData()
    }
    // END MARK
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if shouldShowSearchResults {
            return filteredProblems.count
        } else {
            return problems.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProblemTVCell", for: indexPath) as! ProblemTVCell
        
        // Configure the cell...
        if shouldShowSearchResults {
            cell.problem = filteredProblems[indexPath.row]
        } else {
            cell.problem = problems[indexPath.row]
        }
        cell.delegate = self

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: -- MGSwipeTableCellDelegate
    func swipeTableCell(_ cell: MGSwipeTableCell, swipeButtonsFor direction: MGSwipeDirection, swipeSettings: MGSwipeSettings, expansionSettings: MGSwipeExpansionSettings) -> [UIView]? {
        
        swipeSettings.transition = .drag
        expansionSettings.buttonIndex = 0
        
        if direction == MGSwipeDirection.leftToRight {
            expansionSettings.fillOnTrigger = true
            expansionSettings.threshold = 1.5
            let color = UIColor.init(red:1.0, green:59/255.0, blue:50/255.0, alpha:1.0)
            let path = self.tableView.indexPath(for: cell)!
            
            return [
                MGSwipeButton(title: "Trash it", backgroundColor: color, callback: { (cell) -> Bool in
                    let id = self.problems[path.row].id
                    for problem in self.realm.objects(Problem.self).filter("id == %@", id) {
                        try! self.realm.write {
                            problem.isTrashed = true
                        }
                    }
                    self.problems.remove(at: path.row)
                    self.tableView.deleteRows(at: [path], with: .right)
                    
                    return false //don't autohide to improve delete animation
                })
            ]
        }
        else {
            expansionSettings.fillOnTrigger = false
            expansionSettings.threshold = 1.0
            //let padding = 15
            let color = UIColor(red: 179/255, green: 136/255, blue: 250/255, alpha: 1.0)
            let path = self.tableView.indexPath(for: cell)!
            let problemCell = cell as! ProblemTVCell
            
            return [
                MGSwipeButton(title: readFavoriteStatus(cur: problemCell.problem.isFavorite), backgroundColor: color, callback: { (cell) -> Bool in
                    let id = self.problems[path.row].id
                    for problem in self.realm.objects(Problem.self).filter("id == %@", id) {
                        try! self.realm.write {
                            problem.isFavorite = !problem.isFavorite
                        }
                    }
                    //problemCell.problem.isFavorite = !(problemCell.problem.isFavorite)
                    problemCell.toggleFavorite()
                    problemCell.refreshContentView()
                    (cell.rightButtons[0] as! UIButton).setTitle(self.readFavoriteStatus(cur: problemCell.problem.isFavorite), for: UIControlState());
                    return true
                })
            ]
        }
    }
    
    func readFavoriteStatus(cur: Bool) -> String {
        if cur == true { // cur is favorite
            return "Mark as unfavorite"
        } else {
            return "Mark as favorite"
        }
    }

    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
//        let more = UITableViewRowAction(style: .default, title: "More") { action, index in
//            print("more button tapped")
//            // cell animation
//            tableView.setEditing(false, animated: true)
//        }
//        more.backgroundColor = .lightGray
//        
//        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
//            print("favorite button tapped")
//            // mark "isFavorite" field of problem with "id" in realm to be true
//            let id = self.problems[index.row].id
//            for problem in self.realm.objects(Problem.self).filter("id == %@", id) {
//                try! self.realm.write {
//                    problem.isFavorite = true
//                }
//            }
//            // cell animation
//            tableView.setEditing(false, animated: true)
//        }
//        favorite.backgroundColor = UIColor(red: 179/255, green: 136/255, blue: 250/255, alpha: 1.0)
//        
//        let share = UITableViewRowAction(style: .destructive, title: "Share") { action, index in
//            print("share button tapped")
//            // cell animation
//            tableView.setEditing(false, animated: true)
//        }
//        share.backgroundColor = UIColor(red: 51/255, green: 210/255, blue: 236/255, alpha: 1.0)
//        
//        return [share, favorite, more]
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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowProblemDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                var problem: Problem
                if shouldShowSearchResults {
                    problem = filteredProblems[indexPath.row]
                } else {
                    problem = problems[indexPath.row]
                }
                let destController = segue.destination as! ProblemDetailViewController
                destController.curProblem = problem
            }
        }
    }
    
    // MARK: - Show Scroll View Indicator
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if tableView.numberOfRows(inSection: 0) > 3 {
            for view in tableView.subviews
            {
                if view is UIImageView
                {
                    let imageView = view as? UIImageView
                    delay(bySeconds: 0.7) {
                        imageView?.isHidden = false
                        imageView?.layer.removeAllAnimations()
                        imageView?.alpha = 1.0
                    }
                }
            }
        }
    }
    
    public func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .main, closure: @escaping () -> Void) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchLevel.dispatchQueue.asyncAfter(deadline: dispatchTime, execute: closure)
    }
    
    public enum DispatchLevel {
        case main, userInteractive, userInitiated, utility, background
        var dispatchQueue: DispatchQueue {
            switch self {
            case .main: return DispatchQueue.main
            case .userInteractive: return DispatchQueue.global(qos: .userInteractive)
            case .userInitiated: return DispatchQueue.global(qos: .userInitiated)
            case .utility: return DispatchQueue.global(qos: .utility)
            case .background: return DispatchQueue.global(qos: .background)
            }
        }
    }
    // END MARK
    
    
}













