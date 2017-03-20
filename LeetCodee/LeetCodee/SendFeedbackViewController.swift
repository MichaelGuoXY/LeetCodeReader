//
//  SendFeedbackViewController.swift
//  LeetCodee
//
//  Created by Xiaoyu Guo on 3/20/17.
//  Copyright © 2017 Xiaoyu Guo. All rights reserved.
//

import UIKit
import MessageUI

class SendFeedbackViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        content.layer.cornerRadius = 10.0
        sendBtn.layer.cornerRadius = 10.0
        cancelBtn.layer.cornerRadius = 10.0
        content.layer.masksToBounds = true
        sendBtn.layer.masksToBounds = true
        cancelBtn.layer.masksToBounds = true
    }

    @IBAction func sendBtnClicked(_ sender: UIButton) {
        sendEmail()
        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["xyg125@gmail.com"])
            mail.setSubject(subject.text!)
            mail.setMessageBody(String.init(format: "<p>%@</p>", content.text), isHTML: true)
            
            present(mail, animated: true)
        } else {
            let alertController = UIAlertController(title: "Send Error", message: "Sorry, send feedback failed, please try it again later", preferredStyle: UIAlertControllerStyle.alert)
//            let DestructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.Destructive) {
//                (result : UIAlertAction) -> Void in
//                print("Destructive")
//            }
//            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            
//            alertController.addAction(DestructiveAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        subject.resignFirstResponder()
        content.resignFirstResponder()
    }

}
