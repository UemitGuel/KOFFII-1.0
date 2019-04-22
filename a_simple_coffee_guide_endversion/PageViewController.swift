//
//  PageViewController.swift
//  a_simple_coffee_guide_endversion
//
//  Created by Ümit Gül on 26.02.19.
//  Copyright © 2019 Ümit Gül. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "Zubereitung_nav"),
            self.getViewController(withIdentifier: "Kaffeewissen_Nav"),
        ]
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate   = self
        
        self.view.backgroundColor = UIColor.white
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = UIColor.white
        navigationItem.backBarButtonItem = backButton
        
        
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
}

extension PageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0          else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return pages.first }
        
        guard pages.count > nextIndex else { return nil         }
        
        return pages[nextIndex]
    }
}

extension PageViewController: UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    } // The number of items reflected in the page indicator.
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    } // The selected item reflected in the page indicator.
    
}

