//
//  RootViewController.swift
//  UIPageViewControllerDemo
//
//  Created by Andrew on 16/6/24.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UIPageViewControllerDelegate {

    var pageViewController:UIPageViewController?
    
     var _modelController: ModelViewController? = nil
    
    var modelController:ModelViewController{
        if(_modelController == nil){
         _modelController = ModelViewController()
        }
        
        return _modelController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageViewController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController?.delegate=self
        
        let startingViewController:DataViewController = self.modelController.viewControllerAtIndex(0)!
        let viewControllers = [startingViewController]
        
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: true) { (done) in
        }
        
        self.pageViewController?.dataSource = self.modelController
        
        self.addChildViewController(self.pageViewController!)
        
        self.view.addSubview(self.pageViewController!.view)
        
        //设置page view controller's bounds
        let pageviewRect = self.view.bounds
        self.pageViewController?.view.frame = pageviewRect
        self.pageViewController!.didMoveToParentViewController(self)
        
    }
    
    
    
    
    
    //MARK: - UIPageViewController delegate
    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if(orientation == .Portrait)||(orientation == .PortraitUpsideDown)||(UIDevice.currentDevice().userInterfaceIdiom == .Phone){
            let currentViewController = self.pageViewController!.viewControllers![0]
            
            let viewControllers = [currentViewController]
            
            self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
            self.pageViewController!.doubleSided = false
            return .Min
        }
        
        let currentController = self.pageViewController!.viewControllers![0] as! DataViewController
        var viewControllers:[UIViewController]
        
        let indexOfCurrentViewController  = self.modelController.indexOfViewController(currentController)
        
        if(indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0){
            let nextViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerAfterViewController: currentController)
            viewControllers  = [currentController,nextViewController!]
        }else{
         let previousViewControler = self.modelController.pageViewController(self.pageViewController!, viewControllerBeforeViewController: currentController)
            viewControllers = [previousViewControler!,currentController]
        }
        
        self.pageViewController?.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
        
        return .Mid
    }
    
    
    
    
}










