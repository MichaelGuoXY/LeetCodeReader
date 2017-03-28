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
    static let userdefault = UserDefaults.standard
    
    //    static func fetchAllProblems() {
    //        ref.child("problems").observeSingleEvent(of: .value, with: { (snapshot) in
    //            let val = snapshot.value as! NSDictionary
    //
    //            for (_, dict) in val {
    //
    //                let value = dict as! NSDictionary
    //                let id = value["id"] as! Int
    //                let title = value["title"] as! String
    //                let description = value["description"] as! String
    //                let difficulty = value["difficulty"] as! String
    //                let problemLink = value["problem_link"] as! String
    //                let editorialLink = value["editorial_link"] as! String
    //                let acceptance = value["acceptance"] as! Float
    //                let tags = value["tags"] as! String
    //                // if realm already has this problem, then skip
    //                if realm.objects(Problem.self).filter("id == %@", id).count > 0 {
    //                    continue
    //                }
    //                let problem = Problem()
    //                problem.initialize(id: id, title: title, acceptance: acceptance, description: description, difficulty: difficulty, editorialLink: editorialLink, problemLink: problemLink, tags: tags)
    //                try! realm.write {
    //                    realm.add(problem)
    //                }
    //                print(String(id) + " problem has been added to realm")
    //            }
    //            //reloadTableView()
    //        }) { (error) in
    //            print(error.localizedDescription)
    //        }
    //    }
    //
    //    static func fetchSolutionsWithID(id: Int, updateSolutions: @escaping (_ updatedSolutions: List<RString>) -> ()) {
    //        let solutions = List<RString>()
    //        // TODO: fetch solutions with ID given
    //
    //        let idQuery = ref.child("problems").queryOrdered(byChild: "id").queryEqual(toValue: id)
    //        idQuery.observeSingleEvent(of: .childAdded, with: { (snapshot) in
    //            var problem = snapshot.value as! NSDictionary
    //            problem = problem.allValues[0] as! NSDictionary // dictionary
    //            for solution in problem["solutions"] as! NSArray {
    //                let solu = RString()
    //                solu.stringValue = solution as! String
    //                solutions.append(solu)
    //            }
    //            updateSolutions(solutions)
    //            print(String(id) + " 's solutions fetched")
    //        }) { (error) in
    //            print(error.localizedDescription)
    //        }
    //
    //        // END TODO
    //        // return solutions
    //    }
    static func checkIfNeedsUpdate() {
        
    }
    
    static func fetchAllProblems(navigate: @escaping () -> (), progressBar: GTProgressBar, label: UILabel) {
        ref.child("problems").observeSingleEvent(of: .value, with: { (snapshot) in
            let val = snapshot.value as! NSDictionary
            let count = val.count
            for (_, dict) in val {
                let value = dict as! NSDictionary
                let id = value["id"] as! Int
                let title = value["title"] as! String
                let description = value["description"] as! String
                let difficulty = value["difficulty"] as! String
                let problemLink = value["problem_link"] as! String
                let editorialLink = value["editorial_link"] as! String
                let acceptance = value["acceptance"] as! Float
                let tags = value["tags"] as! String
                let timestamp = value["timestamp"] as! Double
                let solutions = value["solutions"] as! NSArray
                
                print(String(id) + " problem fetched")
                label.text = "#" + String(id) + " problem fetched...😊"
                progressBar.animateTo(progress: progressBar.progress + CGFloat(1.0 / Float(count)))
                // this step allows UI updating, very important
                RunLoop.main.run(until: NSDate(timeIntervalSinceNow: 0.01) as Date)
                
                
                if realm.objects(Problem.self).filter("id == %@", id).count > 0 {
                    // if realm already has this problem timestamp greater than this one's, then skip
                    if realm.objects(Problem.self).filter("id == %@", id)[0].timestamp - timestamp > -1 {
                        continue
                    } else {
                        // update old problem
                        let oldProblem = realm.objects(Problem.self).filter("id == %@", id)[0]
                        try! realm.write {
                            oldProblem.title = title
                            oldProblem.acceptance = acceptance
                            oldProblem.descriptionn = description
                            oldProblem.difficulty = difficulty
                            oldProblem.editorialLink = editorialLink
                            oldProblem.solutions.removeAll()
                            for solution in solutions {
                                let solu = RString()
                                solu.stringValue = solution as! String
                                oldProblem.solutions.append(solu)
                            }
                            oldProblem.tags = tags
                            oldProblem.timestamp = timestamp
                        }
                    }
                } else {
                    // insert new problem
                    let problem = Problem()
                    problem.initialize(id: id, title: title, acceptance: acceptance, description: description, difficulty: difficulty, editorialLink: editorialLink, problemLink: problemLink, solutions: solutions, tags: tags, timestamp: timestamp)
                    try! realm.write {
                        realm.add(problem)
                    }
                }
            }
            //reloadTableView()
            progressBar.animateTo(progress: 1)
            navigate()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
