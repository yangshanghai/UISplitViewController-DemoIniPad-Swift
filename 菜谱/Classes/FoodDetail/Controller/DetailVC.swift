//
//  DetailVC.swift
//  菜谱
//
//  Created by xiaomage on 16/4/27.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class DetailVC: UITableViewController {

    // 食品列表的数据模型
    var foods: [FoodModel] = [FoodModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 监听通知, 根据类型的变化, 而显示不同的食品列表
        NotificationCenter.default.addObserver(self, selector: #selector(DetailVC.typeChange(notification:)), name: NSNotification.Name(rawValue: kTypeChange), object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
  // 类型改变调用的方法
    @objc func typeChange(notification: NSNotification) -> () {
        let obj = notification.object as? TypeModel
        
        // 根据外界传递的idstr, 加载不同的食品列表
        let datas = DataTool.getFoodListData(idStr: (obj?.idstr!)!)
        
        foods = datas
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = foods[indexPath.row]
        
        // 获取url
        let url = Bundle.main.url(forResource: food.idstr! + ".html", withExtension: nil, subdirectory: "Html/food/")
        
        // 通过web控制器, 加载食物做法步骤详情
        let webVC = WebViewVC()
        webVC.url = url as NSURL?
        
        // 包装导航控制器
        let nav = UINavigationController(rootViewController: webVC)
        
        // 设置弹出样式
        nav.modalPresentationStyle = .formSheet
        
        // 弹出控制器
        present(nav, animated: true, completion: nil)

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "food"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        
        // 1. 取出模型
        let food = foods[indexPath.row]
        // 2. 赋值
        cell?.textLabel?.text = food.name
        
        
        return cell!
    }

    
}
