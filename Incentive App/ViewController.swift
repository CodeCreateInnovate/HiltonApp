//
//  ViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/3/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var window: UIWindow?
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageTitles = NSArray(objects: "HGV / EHI","Calculate Sick Time", "Set Goals", "View Statistics")
        self.pageImages = NSArray(objects: "","Sick_Time","Set_Goals","View_Stats")
        
        
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(index: 0) as ContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: self.view.frame.size.height - 75)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
        
    }

    
    //Button To Starting Setting Up Name and Initial Goals
    @IBAction func getStarted(sender: AnyObject) {
        self.performSegue(withIdentifier: "NameEntryVC", sender: nil)
        
    }

    func viewControllerAtIndex(index: Int) -> ContentViewController {
        
        if self.pageTitles.count == 0 || index >= self.pageTitles.count {
            
            return ContentViewController()
        }
        
        let vc: ContentViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController)!
        
        vc.imageFile = self.pageImages[index] as? String
        vc.titleIndex = self.pageTitles[index] as? String
        vc.pageIndex = index
        
        return vc
    }

    //MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? ContentViewController
        var index = (vc?.pageIndex)! as Int
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? ContentViewController
        var index = (vc?.pageIndex)! as Int
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if index == self.pageTitles.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
        
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}



