//
//  MasterTVC.swift
//  菜谱
//
//  Created by xiaomage on 16/4/27.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

let kTypeChange = "typeChange"

class MasterTVC: UITableViewController {

    // master控制器, 显示类型的数据源
    var typeMs: [TypeModel] = [TypeModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeMs = DataTool.getTypeData()
    }
  
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeMs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "TYPE"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        
        // 1. 取出模型
        let type = typeMs[indexPath.row]
        // 2. 赋值
        cell?.textLabel?.text = type.name
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = typeMs[indexPath.row]
        
        // 通过通知, 传递值, 让detailvc 更新不同类型的食物列表
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kTypeChange), object: type)
    }
    
    
}
