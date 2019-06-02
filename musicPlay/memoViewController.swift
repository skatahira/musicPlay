//
//  memoViewController.swift
//  musicPlay
//
//  Created by 片平駿介 on 2019/06/02.
//  Copyright © 2019 ShunsukeKatahira. All rights reserved.
//

import UIKit

private let unselecterRow = -1

class memoViewController: UIViewController {
    // UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
    @IBOutlet weak var editMemoField: UITextField!
    @IBOutlet weak var memoListView: UITableView!
    
    var memoList: [String] = []
    var editRow: Int = unselecterRow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoListView.register(UITableView.self, forCellReuseIdentifier: "Cell")
        editMemoField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapSubmitButton(_ sender: UIButton) {
        applyMemo()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        if indexPath.row >= memoList.count {
            return cell
        }
        
        cell.textLabel?.text = memoList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row >= memoList.count {
            return
        }
        editRow = indexPath.row
        editMemoField.text = memoList[editRow]
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        applyMemo()
        return true
    }
    
    func applyMemo() {
        if editMemoField.text == nil {
            return
        }
        
        if editRow == unselecterRow {
            memoList.append(editMemoField.text!)
        } else {
            memoList[editRow] = editMemoField.text!
        }
        editMemoField.text = ""
        editRow = unselecterRow
        memoListView.reloadData()
    }
    

}

