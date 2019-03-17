//
//  TweetViewController.swift
//  Twitter
//
//  Created by Rafael Carmilema on 3/16/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var TweetTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TweetTextView.delegate = self
        TweetTextView.becomeFirstResponder()
        //TweetTextView.text = "What's on your mind?"
        //TweetTextView.textColor = UIColor.lightGray
       // TweetTextView.selectedTextRange = TweetTextView.textRange(from: TweetTextView.beginningOfDocument, to: TweetTextView.beginningOfDocument)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if !TweetTextView.text.isEmpty{
            print(TweetTextView.text)
            TwitterAPICaller.client?.postTweet(tweetString: TweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error with posting Tweet:",Error)
                self.dismiss(animated: true, completion: nil)
            })
        }
        else{
            ToastView.shared.short(self.view, txt_msg: "Can't post an empty Tweet!")
        }
    }
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        TweetTextView.text = ""
//    }
//    textview
//    func textViewDidChangeSelection(_ textView: UITextView) {
//        if self.view.window != nil {
//            if textView.textColor == UIColor.lightGray {
//                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//            }
//        }
//    }
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        // Combine the textView text and the replacement text to
//        // create the updated text string
//        let currentText:String = textView.text
//        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
//
//        // If updated text view will be empty, add the placeholder
//        // and set the cursor to the beginning of the text view
//        if updatedText.isEmpty {
//
//            textView.text = "What's on your mind?"
//            textView.textColor = UIColor.lightGray
//
//            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
//        }
//
//            // Else if the text view's placeholder is showing and the
//            // length of the replacement string is greater than 0, set
//            // the text color to black then set its text to the
//            // replacement string
//        else if textView.textColor == UIColor.lightGray && !text.isEmpty {
//            textView.textColor = UIColor.black
//            textView.text = text
//        }
//
//            // For every other case, the text should change with the usual
//            // behavior...
//        else {
//            return true
//        }
//
//        // ...otherwise return false since the updates have already
//        // been made
//        return false
//    }
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
