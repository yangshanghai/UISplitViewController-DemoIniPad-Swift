//
//  TypeModel.swift
//  菜谱
//
//  Created by xiaomage on 16/4/27.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

// 类型模型
class TypeModel: NSObject {

    var idstr: String?

    var name: String?
    
    
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
