//
//  HomeTableViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/16/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import RealmSwift
import SideMenu

class HomeTableViewController: UITableViewController, CustomSearchControllerDelegate, LeftMenuDelegate {
    @IBOutlet weak var leftMenuButton: UIBarButtonItem!
    @IBOutlet weak var rightMenuButton: UIBarButtonItem!
    
    var problems = [Problem]()
    var filteredProblems = [Problem]()
    var shouldShowSearchResults = false
    
    var searchController: CustomSearchController!
    
    let realm = try! Realm()
    
    @IBAction func leftMenuBtnClicked(_ sender: UIBarButtonItem) {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rightMenuBtnClicked(_ sender: UIBarButtonItem) {
        present(SideMenuManager.menuRightNavigationController!, animated: true, completion: nil)
        //dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // download from Firebase
        FirebaseManager.fetchAllProblems(reloadTableView: reloadTableView)
        
        // Define the menus
        //        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: self)
        //        menuLeftNavigationController.leftSide = true
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftSideMenuNC") as! UISideMenuNavigationController
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        let leftMenuVC = menuLeftNavigationController.viewControllers[0] as! LeftMenuViewController
        leftMenuVC.delegate = self
        
        // let menuRightNavigationController = UISideMenuNavigationController(rootViewController: self)
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightSideMenuNC") as! UISideMenuNavigationController
        SideMenuManager.menuRightNavigationController = menuRightNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        // table view cell auto fit height
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        // side menu config
        SideMenuManager.menuFadeStatusBar = false
        
        // config navi bar color
        navigationController?.navigationBar.barTintColor = UIColor(red: 85/255, green: 210/255, blue: 251/255, alpha: 0.9)
        
        // configure search controller
        configureSearchController()
    }
    
    func reloadTableView() {
        // get all problems from Realm
        problems = [Problem]()
        for problem in realm.objects(Problem.self).sorted(byKeyPath: "id") {
            problems.append(problem)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureSearchController() {
        // Initialize and perform a minimum configuration to the search controller.
        searchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width * 0.7, height: 30.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: .white, searchBarTintColor: UIColor(red: 85/255, green: 210/255, blue: 251/255, alpha: 0.9))
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
        for problem in realm.objects(Problem.self).sorted(byKeyPath: "id").filter("title contains[c] %@", searchText) {
            filteredProblems.append(problem)
        }
        // ...
        
        // Reload the tableview.
        tableView.reloadData()
    }
    
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
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .default, title: "More") { action, index in
            print("more button tapped")
            // cell animation
            tableView.setEditing(false, animated: true)
        }
        more.backgroundColor = .lightGray
        
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
            print("favorite button tapped")
            // mark "isFavorite" field of problem with "id" in realm to be true
            let id = self.problems[index.row].id
            for problem in self.realm.objects(Problem.self).filter("id == %@", id) {
                try! self.realm.write {
                    problem.isFavorite = true
                }
            }
            // cell animation
            tableView.setEditing(false, animated: true)
        }
        favorite.backgroundColor = UIColor(red: 179/255, green: 136/255, blue: 250/255, alpha: 1.0)
        
        let share = UITableViewRowAction(style: .destructive, title: "Share") { action, index in
            print("share button tapped")
            // cell animation
            tableView.setEditing(false, animated: true)
        }
        share.backgroundColor = UIColor(red: 51/255, green: 210/255, blue: 236/255, alpha: 1.0)
        
        return [share, favorite, more]
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
    
    // MARK: - LeftMenuDelegate
    func sortById(ascending: Bool) {
        // get all problems from Realm
        problems = [Problem]()
        for problem in realm.objects(Problem.self).sorted(byKeyPath: "id", ascending: ascending) {
            problems.append(problem)
        }
        tableView.reloadData()
    }
    
    func sortByTitle(ascending: Bool) {
        // get all problems from Realm
        problems = [Problem]()
        for problem in realm.objects(Problem.self).sorted(byKeyPath: "title", ascending: ascending) {
            problems.append(problem)
        }
        tableView.reloadData()
    }
    
    func sortByAccepDiff(ascending: Bool) {
        if ascending {
            problems = [Problem]()
            for problem in realm.objects(Problem.self).filter("difficulty == 'Easy'").sorted(byKeyPath: "acceptance", ascending: !ascending) {
                problems.append(problem)
            }
            for problem in realm.objects(Problem.self).filter("difficulty == 'Medium'").sorted(byKeyPath: "acceptance", ascending: !ascending) {
                problems.append(problem)
            }
            for problem in realm.objects(Problem.self).filter("difficulty == 'Hard'").sorted(byKeyPath: "acceptance", ascending: !ascending) {
                problems.append(problem)
            }
            tableView.reloadData()
        } else {
            problems = [Problem]()
            for problem in realm.objects(Problem.self).filter("difficulty == 'Hard'").sorted(byKeyPath: "acceptance", ascending: !ascending) {
                problems.append(problem)
            }
            for problem in realm.objects(Problem.self).filter("difficulty == 'Medium'").sorted(byKeyPath: "acceptance", ascending: !ascending) {
                problems.append(problem)
            }
            for problem in realm.objects(Problem.self).filter("difficulty == 'Easy'").sorted(byKeyPath: "acceptance", ascending: !ascending) {
                problems.append(problem)
            }
            tableView.reloadData()
        }
    }
}













