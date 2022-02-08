//
//  ViewController.swift
//  new-cartoons
//
//  Created by Helder on 02/08/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let controller = PageViewController()
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }


}

