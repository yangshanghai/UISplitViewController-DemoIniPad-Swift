//
//  WebViewVC.swift
//  菜谱
//
//  Created by xiaomage on 16/4/27.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {
    
    
    var url: NSURL?
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if url != nil {
            // 加载网页内容
            let request = NSURLRequest(url: url! as URL)
            webView.loadRequest(request as URLRequest)
        }
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: UIBarButtonItemStyle.done, target: self, action: #selector(close))
        
        
    }
    
    
    @objc func close() -> () {
        dismiss(animated: true, completion: nil)
    }
    

   
}
