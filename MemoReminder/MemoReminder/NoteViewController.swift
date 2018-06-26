//
//  NoteViewController.swift
//  MemoReminder
//
//  Created by home on 2018/06/26.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    // プロパティを定義
    var note: Note
    
    let memoTextView: UITextView
    
    // イニシャライザ
    init(
        note: Note
        ) {
        self.note = note
        self.memoTextView = UITextView.newAutoLayout()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
