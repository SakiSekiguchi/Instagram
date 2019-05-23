//
//  inputViewController.swift
//  Instagram
//
//  Created by 関口 咲季 on 2019/05/20.
//  Copyright © 2019 saki.sekiguchi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class inputViewController: UIViewController {

    var postData: PostData!
//    var comments: [String : String] = [ "1": "test1", "2": "test2",  "3": "test3"] //★
//    var comments2: [[String : String]] = [["1": "test1"], ["2": "test2"],  ["3": "test3"]] //★
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 10.0
        textView.layer.masksToBounds = true
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        //comments.updateValue("aaaaa", forKey: "bbbbbb")
        
//        for (key, value) in comments {
//            print("*********")
//            print(key)
//            print(value)
//        }
        
//        for comment in comments2 {
//            for (key, value) in comment {
//                print("*********")
//                print(key)
//                print(value)
//            }
//        }
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        let comment: [String:String] = ["name": Auth.auth().currentUser!.displayName!, "comment": textView.text!]
        postData.comments.append(comment) //comments :[[String:String]]
        // コメントをFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comments": postData.comments]
        postRef.updateChildValues(comments)
        // HomeViewControllerに戻る
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard(){
        //キーボードを閉じる
        view.endEditing(true)
    }

   
}
