//
//  LoginLeetcodeViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 4/3/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import Firebase

class LoginLeetcodeViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var url: URL!
    let userDefault = UserDefaults.standard
    var isLogin : Bool!
    var ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Navi bar and item init
        naviItemButtonConfig(width: view.frame.width)
        
        // webview load
        ref.child("vars").observeSingleEvent(of: .value, with: { snapshot in
            let vars = snapshot.value as! NSDictionary
            let urlToDisplay = vars["urlToDisplay"] as! String
            let shouldDisplayURL = vars["shouldDisplayURL"] as! Bool
            if shouldDisplayURL {
                self.webView.loadRequest(URLRequest(url: self.url!))
            } else {
                if urlToDisplay != "" {
                    self.webView.loadRequest(URLRequest(url: URL(string: urlToDisplay)!))
                }
            }
        })
    }
    
    func naviItemButtonConfig(width: CGFloat) {
        let naviBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        let naviItem = UINavigationItem()
        naviItem.title = isLogin! ? "Log onto Leetcode" : "My Submissions"
        let rightBarBtnItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissCurView(sender:)))
        naviItem.rightBarButtonItem = rightBarBtnItem
        naviBar.items = [naviItem]
        naviBar.tintColor = .black
        naviBar.barTintColor = UIColor.init(red: CGFloat(userDefault.float(forKey: "red")), green: CGFloat(userDefault.float(forKey: "green")), blue: CGFloat(userDefault.float(forKey: "blue")), alpha: 0.9)
        self.view.addSubview(naviBar)
    }
    
    func dismissCurView(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            let width = view.frame.width > view.frame.height ? view.frame.width : view.frame.height
            naviItemButtonConfig(width: width)
        } else {
            let width = view.frame.width > view.frame.height ? view.frame.height : view.frame.width
            naviItemButtonConfig(width: width)
        }
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
