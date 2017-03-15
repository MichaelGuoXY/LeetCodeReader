//
//  ProblemDetailViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/14/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class ProblemDetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionWebView: UIWebView!
    
    var curProblem: Problem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadDescriptionWebView()
    }
    
    func loadDescriptionWebView() {
        let html = "<html><head><title></title></head><body style=\"background:transparent;\">" + curProblem.descriptionn + "</body></html>"
        descriptionWebView.backgroundColor = UIColor.clear
        descriptionWebView.loadHTMLString(html, baseURL: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
