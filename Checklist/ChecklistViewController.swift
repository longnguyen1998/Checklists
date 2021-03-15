//
//  ViewController.swift
//  Checklist
//
//  Created by savvycom2021 on 3/11/21.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    // Mark : Sử dụng array
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // có một bộ điều khiển duy nhất cho một luồng điều hướng nhất định.
        // A single navigation controller could present multiple view controllers as part of its navigation flow.
        // Each view controller in a navigation hierarchy has a reference to the navigation controller which presented it.
        navigationController?.navigationBar.prefersLargeTitles = true // điều hướng chính
        // Do any additional setup after loading the view.
        let item1 = ChecklistItem()
        item1.text = "Cáu vcl"
        item1.checked = true
        items.append(item1)

        
        let item2 = ChecklistItem()
        item2.text = "Cái checklist này khắm vcl"
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Mình phải chiến đc cái checklist này!"
        items.append(item3)
    }

    @IBAction func addItem(_ sender: Any) {
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "Dòng mới này!"
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        print(newRowIndex)
        print(indexPath)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        print(indexPaths)
    }
    
    
    // Table view datasource
    // numberOfRowsInSection Trả về số dòng dữ liệu
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // cellForRowAt : Method này được gọi mỗi lần một cell chuẩn bị được hiển thị
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    // table view Delegate
    // didSelectRowAt : báo cho ta biết dòng nào đang đc chọn
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.checked = !item.checked
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // xoá dòng 
        items.remove(at: indexPath.row)
        let indexPath = [indexPath]
        tableView.deleteRows(at: indexPath, with: .automatic)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item : ChecklistItem){
//        let item = items[indexPath.row]
        if item.checked {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell:UITableViewCell, with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
}

