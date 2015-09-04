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
    
    var titles = ["0: Hello", "1: World", "2: Swift", "3: Programming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // (1) Edit ボタン
        navigationItem.leftBarButtonItem = editButtonItem()
        
//        tableView.allowsSelectionDuringEditing = true
    }

    // (2) Edit ボタン押された
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }

    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
    
    // (3) 削除を有効
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // (4) 削除された時の処理
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 先にデータを編集
        titles.removeAtIndex(indexPath.row)
        
        // それからテーブルの更新
        tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: indexPath.row, inSection: 0)],
            withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    // (5) 移動を有効
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // (6) 移動時の処理
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        // データの順番を整える
        let targetTitle = titles[sourceIndexPath.row]
        if let index = titles.indexOf(targetTitle) {
            titles.removeAtIndex(index)
            titles.insert(targetTitle, atIndex: destinationIndexPath.row)
            print(titles)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print(titles[indexPath.row])
    }

//    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
//        
//        if tableView.editing {
//            return UITableViewCellEditingStyle.Delete
//        } else {
//            return UITableViewCellEditingStyle.None
//        }
//    }
}

