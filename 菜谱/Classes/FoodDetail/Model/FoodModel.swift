//
//  FoodModel.swift
//  菜谱
//
//  Created by xiaomage on 16/4/27.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

// 视频模型
class FoodModel: NSObject {

    
    var diff: String?
    
    var idstr: String?
    
    var imageUrl: String?
    
    var name: String?
    
    var time: String?
    
    var url: String?
    
    override init() {
        super.init()
    }
    
    init(dic: [String: AnyObject]) {
        
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

    
}
