//
//  PageViewController.swift
//  new-cartoons
//
//  Created by Helder on 02/08/2022.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        let cartoonCardViewController = CartoonCardViewController()
        addChild(cartoonCardViewController)
        cartoonCardViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cartoonCardViewController.view)
        
        NSLayoutConstraint.activate([
            cartoonCardViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cartoonCardViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cartoonCardViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            cartoonCardViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
