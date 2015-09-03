//
//  ViewController.swift
//  TableViewEditSample
//
//  Created by 平松　亮介 on 2015/09/03.
//  Copyright © 2015年 Ryosuke Hiramatsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpEditButton()
    }
    
    private func setUpEditButton() {
        // (1) Edit ボタン
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    // (2) Edit ボタン押された
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }

    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = "cell - \(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    

}

