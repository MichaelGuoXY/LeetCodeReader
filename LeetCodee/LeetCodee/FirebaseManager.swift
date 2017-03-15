//
//  FirebaseManager.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/14/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import Foundation
import Firebase
import RealmSwift

class FirebaseManager: NSObject{
    static var ref = FIRDatabase.database().reference()
    static let realm = try! Realm()
    
    static func fetchAllProblems(reloadTableView: @escaping () -> ()) {
        ref.child("problems").observeSingleEvent(of: .value, with: { (snapshot) in
            let val = snapshot.value as! NSDictionary
            for (_, dict) in val {
                let value = dict as! NSDictionary
                let id = value["id"] as! Int
                let title = value["title"] as! String
                let description = value["description"] as! String
                let difficulty = value["difficulty"] as! String
                let problemLink = value["problem_link"] as! String
                let editorialLink = value["editorial_link"] as! String
                let acceptance = value["acceptance"] as! Float
                let problem = Problem()
                problem.initialize(id: id, title: title, acceptance: acceptance, description: description, difficulty: difficulty, editorialLink: editorialLink, problemLink: problemLink)
                try! realm.write {
                    realm.add(problem)
                }
                reloadTableView()
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    static func fetchSolutionsWithID(id: Int) -> [String] {
        var solutions = [String]()
        // TODO: fetch solutions with ID given
        
        
        
        // END TODO
        return solutions
    }
}
