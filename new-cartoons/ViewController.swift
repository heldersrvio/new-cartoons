//
//  ViewController.swift
//  new-cartoons
//
//  Created by Helder on 02/08/2022.
//
import UIKit

class ViewController: UITabBarController, UIPageViewControllerDelegate {
    var pageViewController: PageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        let wk = WikipediaService()
        wk.getAnimatedSeriesList(for: 2022)
        
        pageViewController = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.delegate = self
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = .white
        let tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        pageViewController.tabBarItem = tabBarItem
        viewControllers = [pageViewController]
        selectedViewController = pageViewController
    }


}

