//
//  DataTool.swift
//  菜谱
//
//  Created by xiaomage on 16/4/27.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class DataTool: NSObject {

    // 获取数据源的方法
    class func getFoodListData(idStr: String) -> [FoodModel] {
        
        // 获取文件路径
        // 1. 获取文件路径
        guard let path = Bundle.main.path(forResource: "type_" + idStr + "_foods.plist", ofType: nil) else  { return [FoodModel]() }
        // 2. 加载文件内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            return [FoodModel]()
        }
        
        
        // 3. 转换成为模型
        
        var models = [FoodModel]()
        for dic in dicArray {
            let resultDic = dic as! [String: AnyObject]
            let model = FoodModel(dic: resultDic)
            models.append(model)
            
        }
        
        // 4. 返回数据
        return models

        
    }
    
    
    // 获取类型数据的方法
    class func getTypeData() -> [TypeModel] {
        
        // 1. 获取文件路径
        guard let path = Bundle.main.path(forResource: "food_types.plist", ofType: nil) else  { return [TypeModel]() }
        
        // 2. 加载文件内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            return [TypeModel]()
        }
        
        // 3. 转换成为模型
        
        var models = [TypeModel]()
        for dic in dicArray {
            let resultDic = dic as! [String: AnyObject]
            let model = TypeModel(dic: resultDic)
            models.append(model)
            
        }
        
        // 4. 返回数据
        return models
        
    }
    
}
