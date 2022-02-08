//
//  CartoonCardViewController.swift
//  new-cartoons
//
//  Created by Helder on 02/08/2022.
//

import UIKit

class CartoonCardViewController: UIViewController {
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 2.0
        view.backgroundColor = .white
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "centralpark-1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let height = imageView.image!.size.height
        let width = imageView.image!.size.width
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: height / width, constant: (-50 * height) / width),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
