//
//  DataViewController.swift
//  UIPageViewControllerDemo
//
//  Created by Andrew on 16/6/24.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
   var dataObject: String = ""
    
    var dataLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orangeColor()
        
        let rect = CGRectMake(100, 100, 100, 100)
        dataLabel = UILabel(frame: rect)
        dataLabel.center = self.view.center
        self.view.addSubview(dataLabel)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if(dataLabel != nil){
         dataLabel.text = dataObject
        }
    }
}
