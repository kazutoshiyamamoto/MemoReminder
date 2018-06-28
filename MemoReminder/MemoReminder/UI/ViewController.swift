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
        self.tableView = UITableView.newAutoLayout()
        self.footerView = UIView.newAutoLayout()
        self.newButton = UIButton(type: .system)
        // AutoLayout解除
        self.newButton.translatesAutoresizingMaskIntoConstraints = false
        self.countLabel = UILabel.newAutoLayout()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ViewControllerのライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        
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
    
    private func addConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
        
        footerView.autoPinEdgesToSuperviewEdges(.left)
        footerView.autoPinEdgesToSuperviewEdges(.right)
        footerView.autoPinEdgesToSuperviewEdges(.Button)
        footerView.autoSetDimension(.height, toSize: 48)
        
        countLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        countLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        
        newButton.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        newButton.autoAlignAxis(toSuperviewAxis: .horizontal)
    }
    
    private func request() {
        let notesManager = NotesManager()
        notes = notesManager.get()
        
        countLabel.text = "\(notes.count)Notes"
        
        tableView.reloadData()
    }
    
    @objc private func didTapNewButton(sender: UIButton) {
        let noteViewController = NoteViewController(note: Note())
        navigationController?.pushViewController(noteViewController, animated: true)
    }
    
    // UITableViewDataSource
    extension ViewController: UITableViewDataSource {
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(
        style: UITableViewCellStyle.subtitle,
        reuseIdentifier: "Cell")
        
        cell.textLabel?.text = notes[indexPath.row].memo
        cell.detailTextLabel?.textColor = UIColor(white: 0.1, alpha: 0.3)
        cell.detailTextLabel?.text = notes[indexPath.row].id
        
        return cell
    }
    }
    
    // UITableViewDelegate
    extension ViewController: UITableViewDelegate {
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let noteViewController = NoteViewController(note: notes[indexPath.row])
            navigationController?.pushViewController(noteViewController, animated: true)
        }
        
        func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 48
        }
        
        override func setEditing(editing: Bool, animated: Bool) {
            super.setEditing(editing, animated: animated)
            tableView.editing = editing
        }
        
        func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            return true
        }
        
        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            
            let notesManager = NotesManager()
            notesManager.delete(notes[indexPath.row].id)
            notes.removeAtIndex(indexPath.row)
            countLabel.text = "\(notes.count) Notes"
            
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade
            )
        }
    }
}

