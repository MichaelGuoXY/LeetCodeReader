//
//  TagViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/19/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import RealmSwift

class TagViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tags = ["Array", "Hash Table", "Linked List", "Math", "Two Pointers", "String", "Binary Search", "Divide and Conquer", "Dynamic Programming", "Backtracking", "Stack", "Heap", "Greedy", "Sort", "Bit Manipulation", "Tree", "Depth-first Search", "Breadth-first Search", "Union Find", "Graph", "Design", "Topological Sort", "Trie", "Binary Indexed Tree", "Recursion", "Brainteaser", "Memoization", "Queue", "Minimax", "Reservoir Sampling", "\"Dynamic Programming\""]
    
    let realm = try! Realm()
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
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
}
