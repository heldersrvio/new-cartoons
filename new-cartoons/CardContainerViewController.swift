//
//  CardContainerViewController.swift
//  new-cartoons
//
//  Created by Helder on 02/08/2022.
//

import UIKit

class CardContainerViewController: UIViewController {
    var page: Int
    
    init(with page: Int) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
