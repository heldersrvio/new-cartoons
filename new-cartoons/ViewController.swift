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
        // Do any additional setup after loading the view.
        pageViewController = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.delegate = self
        addChild(pageViewController)
//        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
//
//        NSLayoutConstraint.activate([
//            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
//            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
//        ])
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

