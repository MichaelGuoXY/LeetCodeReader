//
//  DescriptionTVCell.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/15/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit

class DescriptionTVCell: UITableViewCell {

    @IBOutlet weak var descriptionWebView: UIWebView!
    
    var descriptionOfProblem: String! {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadDescriptionWebView() {
        let baseURLForCss = Bundle.main.url(forResource: "code-style", withExtension: "css")
        let htmlHeader = "<html> \n <head> \n <link href=\"code-style.css\" rel=\"stylesheet\" type=\"text/css\" /> \n </head> \n <body> \n"
        let htmlFooter = "</body> \n </html>"
        let htmlSnippet = descriptionOfProblem
        descriptionWebView.backgroundColor = UIColor.clear
        descriptionWebView.loadHTMLString(String.init(format: "%@%@%@", htmlHeader, htmlSnippet!, htmlFooter), baseURL: baseURLForCss)
    }
    
    func updateUI() {
        loadDescriptionWebView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
