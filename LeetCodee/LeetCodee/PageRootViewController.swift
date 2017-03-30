//
//  PageRootViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/29/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class PageRootViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let pageViewController = segue.destination as? PageViewController {
            pageViewController.pageDelegate = self
        }
    }
}

extension PageRootViewController: MyPageViewControllerDelegate {
    
    func pageViewController(pageViewController: PageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func pageViewController(pageViewController: PageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
    
}
