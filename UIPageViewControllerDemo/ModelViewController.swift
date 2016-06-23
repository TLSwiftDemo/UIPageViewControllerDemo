//
//  ModelViewController.swift
//  UIPageViewControllerDemo
//
//  Created by Andrew on 16/6/24.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit

class ModelViewController: NSObject,UIPageViewControllerDataSource {

    var pageData:[String] = []
    
    override init() {
        super.init()
        
        let dateFormatter = NSDateFormatter()
        
        pageData = dateFormatter.shortMonthSymbols
        
    }
    
    func viewControllerAtIndex(index:Int) -> DataViewController? {
        if(self.pageData.count == 0) || (index>=self.pageData.count){
         return nil
        }
        
        //create new view controller
        let dataViewController = DataViewController()
        dataViewController.dataObject = self.pageData[index]
        
        return dataViewController
    }
    
    func indexOfViewController(viewcontroller:DataViewController) -> Int {
        return pageData.indexOf(viewcontroller.dataObject) ?? NSNotFound
    }
    
    //MARK: - Page view Controller Data Source
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == NSNotFound){
         return nil
        }
        index += 1
        if index == self.pageData.count{
          return nil
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound){
         return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
        
    }
    
    
    
    
    
}
