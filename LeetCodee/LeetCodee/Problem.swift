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
    dynamic var title: String!
    dynamic var acceptance: Float = 0.0
    dynamic var descriptionn: String!
    dynamic var difficulty: String!
    dynamic var editorialLink: String!
    dynamic var problemLink: String!
    var solutions = List<RString>()
    
    func initialize(id: Int, title: String, acceptance: Float, description: String, difficulty: String, editorialLink: String, problemLink: String) {
        self.id = id
        self.title = title
        self.acceptance = acceptance
        self.descriptionn = description
        self.difficulty = difficulty
        self.editorialLink = editorialLink
        self.problemLink = problemLink
    }
    
    // fetch solutions
//    func fetchSolutions(id: Int) -> [String] {
//        solutions = FirebaseManager.fetchSolutionsWithID(id: id)
//        return solutions
//    }
}

class RString: Object {
    dynamic var stringValue = ""
}
