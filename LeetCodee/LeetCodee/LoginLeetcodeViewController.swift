//
//  LoginLeetcodeViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 4/3/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class LoginLeetcodeViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var url: URL!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Navi bar and item init
        naviItemButtonConfig(width: view.frame.width)
        
        // webview load
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
    }
    
    func naviItemButtonConfig(width: CGFloat) {
        let naviBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        let naviItem = UINavigationItem()
        naviItem.title = "Log onto Leetcode"
        let rightBarBtnItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissCurView(sender:)))
        naviItem.rightBarButtonItem = rightBarBtnItem
        naviBar.items = [naviItem]
        naviBar.tintColor = .black
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
