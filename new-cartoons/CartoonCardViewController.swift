//
//  CartoonCardViewController.swift
//  new-cartoons
//
//  Created by Helder on 02/08/2022.
//

import UIKit

class CartoonCardViewController: UIViewController {
    var imageView: UIImageView!
    var label: UILabel!
    var infoLabels: [UILabel] = []
    var contentLabels: [UILabel] = []
    
    override func viewDidLoad() {
        var constraints: [NSLayoutConstraint] = []
        
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
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Central Park"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(label)
        
        infoLabels = ["Country", "Genres", "Episodes", "Release Date", "Preview"].map{ info in
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = info
            l.font = UIFont.boldSystemFont(ofSize: 12)
            return l
        }
        infoLabels.forEach { view.addSubview($0) }
        infoLabels.forEach { constraints.append($0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)) }
        infoLabels.enumerated().forEach { constraints.append($0.offset == 0 ? $0.element.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25) : $0.element.topAnchor.constraint(equalTo: infoLabels[$0.offset - 1].bottomAnchor, constant: 10)) }
        
        contentLabels = ["United States", "Sitcom, musical", "18", "May 29, 2020", "https://en.wikipedia.org/wiki/Central_Park_(TV_series)"
        ].map { content in
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = content
            l.lineBreakMode = .byWordWrapping
            l.numberOfLines = 0
            l.font = UIFont.systemFont(ofSize: 12)
            return l
        }
        contentLabels.forEach { view.addSubview($0) }
        contentLabels.enumerated().forEach { constraints.append($0.element.leadingAnchor.constraint(equalTo: infoLabels[$0.offset].trailingAnchor, constant: 5)) }
        contentLabels.enumerated().forEach { constraints.append($0.offset == 0 ? $0.element.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25) : $0.element.topAnchor.constraint(equalTo: contentLabels[$0.offset - 1].bottomAnchor, constant: 10)) }
        contentLabels.forEach { constraints.append($0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)) }
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: height / width, constant: (-50 * height) / width),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25)
        ] + constraints)
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
