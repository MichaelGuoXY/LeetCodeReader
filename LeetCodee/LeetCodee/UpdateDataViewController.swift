//
//  UpdateDataViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/20/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import RealmSwift
import Gifu

class UpdateDataViewController: UIViewController {
    
    let realm = try! Realm()
    let userdefault = UserDefaults.standard
    var delegate: UpdateDataDelegate!
    
    @IBOutlet weak var gifImgView: GIFImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var progressBar: GTProgressBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // download from Firebase
        progressBar.progress = 0
        progressBar.barBorderColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.barFillColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.barBackgroundColor = UIColor(red:0.77, green:0.93, blue:0.78, alpha:1.0)
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 2
        progressBar.labelTextColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        gifImgView.animate(withGIFNamed: "loading.gif")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Reachability.connectedToNetwork() {
            FirebaseManager.fetchAllProblems(navigate: {
                self.dismiss(animated: true, completion: {
                    self.delegate.reloadHomeViewController()
                })
            }, progressBar: progressBar, label: label)
        } else {
            label.text = "No Internet Connection"
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.dismiss(animated: true, completion: nil)
            }
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

protocol UpdateDataDelegate {
    func reloadHomeViewController()
}

