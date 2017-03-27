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
    
    var realm: Realm! = nil
    let userdefault = UserDefaults.standard
    @IBOutlet weak var blurView: UIView!
    
    @IBOutlet weak var gifImgView: GIFImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var useLocallyForeverBtn: UIButton!
    @IBAction func useLocallyForeverBtnClicked(_ sender: UIButton) {
        userdefault.set(true, forKey: "UseItLocallyForever")
        blurView.isHidden = true
        navigateToHomeView()
    }
    @IBAction func updateBtnClicked(_ sender: UIButton) {
        if Reachability.connectedToNetwork() {
            FirebaseManager.fetchAllProblems(navigate: self.navigateToHomeView, progressBar: progressBar, label: label)
        } else {
            label.text = "No Internet Connection"
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // Your code with delay
                self.navigateToHomeView()
            }
        }
        blurView.isHidden = true
    }
    @IBOutlet weak var useLocallyBtn: UIButton!
    @IBAction func useLocallyBtnClicked(_ sender: UIButton) {
        blurView.isHidden = true
        navigateToHomeView()
    }
    
    @IBOutlet weak var progressBar: GTProgressBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        realm = try! Realm()
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
        // check whether it is the first time opening app
        if realm.objects(Problem.self).count == 0 {
            useLocallyBtn.isEnabled = false
            useLocallyForeverBtn.isEnabled = false
        }
        updateBtn.layer.cornerRadius = 5
        useLocallyBtn.layer.cornerRadius = 5
        updateBtn.layer.masksToBounds = true
        useLocallyBtn.layer.masksToBounds = true
        useLocallyForeverBtn.layer.cornerRadius = 5
        useLocallyForeverBtn.layer.masksToBounds = true
        
        // if "UseItLocallyForever" is true, skip blur view
        if userdefault.bool(forKey: "UseItLocallyForever") == true {
            blurView.isHidden = true
            navigateToHomeView()
        }
    }
    
    func navigateToHomeView() {
        let tabbarViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! MainTabBarViewController
        present(tabbarViewController, animated: true, completion: nil)
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
