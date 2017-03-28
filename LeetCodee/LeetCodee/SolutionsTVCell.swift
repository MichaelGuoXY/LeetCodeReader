//
//  SolutionsTVCell.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/15/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class SolutionsTVCell: UITableViewCell, UIWebViewDelegate{
    @IBOutlet weak var solutionWebView: UIWebView!
    @IBOutlet weak var solutionTitleLabel: UILabel!
    
    var solutionOfProblem: String! {
        didSet {
            updateUI()
        }
    }
    let userDefault = UserDefaults.standard
    var delegate: SolutionReloadDelegate!
    var indexPath: IndexPath!
    
    func updateUI() {

        solutionTitleLabel.font = UIFont(name: userDefault.string(forKey: "SolutionTitleLabelFont")!, size: 17)
        solutionWebView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        solutionWebView.scrollView.backgroundColor = userDefault.bool(forKey: "isNight") ? UIColor.lightGray : UIColor.white
        let arr = solutionOfProblem.components(separatedBy: "FORSPLITROF")
        if arr.count < 1 {return} // may have index out of bounds exception
        let title = arr[0]
        solutionTitleLabel.text = title
        if arr.count < 2 {return} // may have index out of bounds exception
        let html = arr[1]
        loadSolutionnWebView(html: html)
    }
    
    func loadSolutionnWebView(html: String) {
        let baseURLForCss = Bundle.main.url(forResource: "code-style", withExtension: "css")
        let htmlHeader = "<html> \n <head> \n <link href=\"code-style.css\" rel=\"stylesheet\" type=\"text/css\" /> \n </head> \n <body> \n"
        let htmlFooter = "</body> \n </html>"
        let htmlSnippet = html
        solutionWebView.backgroundColor = .white
        solutionWebView.loadHTMLString(String.init(format: "%@%@%@", htmlHeader, htmlSnippet, htmlFooter), baseURL: baseURLForCss)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        solutionWebView.delegate = self
        //solutionWebView.scrollView.isScrollEnabled = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let height_web = webView.scrollView.contentSize.height
        let height_title = solutionTitleLabel.bounds.height
        delegate.passHeightToTableView(indexPath: indexPath, height_title: height_title + 45, height_full: height_web + height_title)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

protocol SolutionReloadDelegate {
    //func reloadTableView(indexPath: IndexPath, height: CGFloat)
    func passHeightToTableView(indexPath: IndexPath, height_title: CGFloat, height_full: CGFloat)
}
