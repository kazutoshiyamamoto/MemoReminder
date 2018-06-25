//
//  ViewController.swift
//  MemoReminder
//
//  Created by home on 2018/06/20.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit
import PureLayout

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

    // ViewControllerのライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.whiteColor
        
        configureNavigationBar()
        addSubviews()
        configureSubviews()
        addConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        request()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Viewのセットアップ
    private func configureNavigationBar() {
        title = "メモ一覧"
        navigationItem.rightBarButtonItem = editButtonItem()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(footerView)
        view.addSubview(newButton)
        view.addSubview(countLabel)
    }
    
    private func configureSubviews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: String(UITableViewCell))
        
        footerView.layer.borderWidth = 0.5
        footerView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        footerView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        
        countLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        newButton.setTitle("メモ追加", for: .normal)
        newButton.addTarget(self, action: #selector(didTapNewButton(_:)), for: .touchUpInside)
    }
    
    private func addConstrains() {
        tableView.autoPinEdgesToSuperviewEdges()
        
        footerView.autoPinEdgesToSuperviewEdges(.Left)
        footerView.autoPinEdgesToSuperviewEdges(.Right)
        footerView..autoPinEdgesToSuperviewEdges(.Button)
        footerView.autoSetDimension(.height, toSize: 48)
        
        countLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        countLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        
        newButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        newButton.autoAlignAxisToSuperviewAxis(.Horizontal)
    }
    
    private func request() {
        let notesManager = notesManager()
        notes = noteManager.get()
        
        countLabel.text = "\(notes.count)Notes"
        
        tableView.reloadData()
    }
    
    @objc private func didTapNewButton(sender: UIButton) {
        let noteViewController = NoteViewController(note: Note())
        navigationController?.pushViewController(noteViewController, animated: true)
    }
    


}

