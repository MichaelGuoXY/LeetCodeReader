//
//  Problem.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/14/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import Foundation
import Firebase
import RealmSwift

class Problem: Object {
    dynamic var id: Int = 0
    dynamic var idStr = ""
    dynamic var title: String!
    dynamic var acceptance: Float = 0.0
    dynamic var descriptionn: String!
    dynamic var difficulty: String!
    dynamic var editorialLink: String!
    dynamic var problemLink: String!
    dynamic var isFavorite = false
    dynamic var isTrashed = false
    var solutions = List<RString>()
    dynamic var tags: String!
    dynamic var timestamp: Double = 0.0
    
    
    func initialize(id: Int, title: String, acceptance: Float, description: String, difficulty: String, editorialLink: String, problemLink: String, solutions: NSArray, tags: String, timestamp: Double) {
        self.id = id
        self.idStr = String(id)
        self.title = title
        self.acceptance = acceptance
        self.descriptionn = description
        self.difficulty = difficulty
        self.editorialLink = editorialLink
        self.problemLink = problemLink
        self.tags = tags
        self.timestamp = timestamp
        for solution in solutions {
            let solu = RString()
            solu.stringValue = solution as! String
            self.solutions.append(solu)
        }
    }
    
//    // get solutions
//    func updateSolutions(solutions: List<RString>) {
//        self.solutions = solutions
//    }
//    
//    // fetch solutions
//    func fetchSolutions() {
//        FirebaseManager.fetchSolutionsWithID(id: id, updateSolutions: updateSolutions)
//    }
}

class RString: Object {
    dynamic var stringValue = ""
}
