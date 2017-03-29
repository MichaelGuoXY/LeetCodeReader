//
//  TagViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/19/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import RealmSwift

class TagViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tags = ["Array", "Hash Table", "Linked List", "Math", "Two Pointers", "String", "Binary Search", "Divide and Conquer", "Dynamic Programming", "Backtracking", "Stack", "Heap", "Greedy", "Sort", "Bit Manipulation", "Tree", "Depth-first Search", "Breadth-first Search", "Union Find", "Graph", "Design", "Topological Sort", "Trie", "Binary Indexed Tree", "Recursion", "Brainteaser", "Memoization", "Queue", "Minimax", "Reservoir Sampling", "\"Dynamic Programming\""]
    
    let realm = try! Realm()
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
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
        self.view.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!, NSForegroundColorAttributeName: UIColor.white]
        self.title = "Tags"
        navigationController?.navigationBar.barTintColor = tabBarController?.tabBar.barTintColor
        
//        tabBarController?.tabBar.barTintColor = userDefault.object(forKey: "BarTintColor") as? UIColor
        tabBarController?.tabBar.tintColor = .white
        
        tableView.tintColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        tableView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        // update fonts if needed
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TagTVCell", for: indexPath)
        cell.textLabel?.font = UIFont(name: userDefault.string(forKey: "TagViewCellTextLabelFont")!, size: 20)
        cell.detailTextLabel?.font = UIFont(name: userDefault.string(forKey: "TagViewCellDetailLabelFont")!, size: 20)
        cell.textLabel?.text = tags[indexPath.row]
        cell.detailTextLabel?.text = String(countForTag(tag: tags[indexPath.row]))
        cell.backgroundColor = .clear
        return cell
    }
    
    func countForTag(tag: String) -> Int {
        return realm.objects(Problem.self).filter("tags contains[c] %@", tag).count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSubTagTVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destController = segue.destination as! TagSubTableViewController
                destController.tag = tags[indexPath.row]
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
        guard let previewViewController = storyboard?.instantiateViewController(withIdentifier: "TagSubTVC") as? TagSubTableViewController else { return nil }
        
        previewViewController.tag = tags[indexPath.row]
        
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
