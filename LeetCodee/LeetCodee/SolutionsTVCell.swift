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
    
    var delegate: CusTVReloadDelegate!
    var indexPath: IndexPath!
    
    func updateUI() {
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
        solutionWebView.backgroundColor = UIColor.clear
        solutionWebView.loadHTMLString(String.init(format: "%@%@%@", htmlHeader, htmlSnippet, htmlFooter), baseURL: baseURLForCss)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        solutionWebView.delegate = self
        //solutionWebView.scrollView.isScrollEnabled = false
    }
//    
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        let height = webView.scrollView.contentSize.height
//        delegate.reloadTableView(indexPath: indexPath, height: height)
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

protocol CusTVReloadDelegate {
    func reloadTableView(indexPath: IndexPath, height: CGFloat)
}
