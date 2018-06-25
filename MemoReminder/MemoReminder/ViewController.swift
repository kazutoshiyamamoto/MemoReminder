//
//  ViewController.swift
//  MemoReminder
//
//  Created by home on 2018/06/20.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ノートに関するプロパティ
    var notes: [Note] = []
    
    // Viewに関わるプロパティ
    let tableView: UITableView
    let footerView: UIView
    let newButton: UIButton
    let countLabel: UILabel
    
    // イニシャライザ
    init() {
        self.tableView = UITableView.newAutoLayoutView()
        self.footerView = UIView.newAutoLayoutView()
        self.newButton = UIButton(type: .system)
        // AutoLayout解除
        self.newButton.translatesAutoresizingMaskIntoConstraints = false
        self.countLabel = UILabel.newAutoLayoutView()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

