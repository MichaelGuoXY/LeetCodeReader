//
//  AllStartsFromHereViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/30/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class AllStartsFromHereViewController: UIViewController {
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let pageRootVC = storyboard?.instantiateViewController(withIdentifier: "PageRootVC") as! PageRootViewController
        let startVC = storyboard?.instantiateViewController(withIdentifier: "StartVC") as! StartViewController
        if userDefault.bool(forKey: "haveLauched") {
            present(startVC, animated: true, completion: nil)
        } else {
            present(pageRootVC, animated: true, completion: nil)
        }
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
