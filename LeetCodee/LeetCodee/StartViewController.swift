//
//  StartViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/20/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import RealmSwift
import Gifu

class StartViewController: UIViewController {
    
    let realm = try! Realm()
    let userdefault = UserDefaults.standard
    
    @IBOutlet weak var gifImgView: GIFImageView!
    @IBOutlet weak var label: UILabel!
    
//    @IBOutlet weak var progressBar: GTProgressBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // download from Firebase
//        progressBar.progress = 0
//        progressBar.barBorderColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
//        progressBar.barFillColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
//        progressBar.barBackgroundColor = UIColor(red:0.77, green:0.93, blue:0.78, alpha:1.0)
//        progressBar.barBorderWidth = 1
//        progressBar.barFillInset = 2
//        progressBar.labelTextColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
//        progressBar.progressLabelInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        FirebaseManager.fetchAllProblems(navigate: self.navigateToHomeView, label: label)
        
//        while self.userdefault.bool(forKey: "cando") != true {
//            let count = self.realm.objects(Problem.self).count
//            DispatchQueue.main.async {
//                self.progressBar.animateTo(progress: CGFloat(Double(count) / 500.0))
//            }
//        }
        gifImgView.animate(withGIFNamed: "loading.gif")
    }
    
    func navigateToHomeView() {
        let tabbarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarVC")
        present(tabbarViewController!, animated: true, completion: nil)
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
