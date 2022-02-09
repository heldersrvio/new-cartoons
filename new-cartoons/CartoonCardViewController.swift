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
    var cartoon: Cartoon
    var infoLabels: [UILabel] = []
    var contentLabels: [UILabel] = []
    
    init(for cartoon: Cartoon) {
        self.cartoon = cartoon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        var constraints: [NSLayoutConstraint] = []
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 2.0
        view.backgroundColor = .white
        
        imageView = UIImageView()
        if let image = cartoon.picture {
            imageView.image = UIImage(named: image)
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let height = imageView.image!.size.height
        let width = imageView.image!.size.width
        view.addSubview(imageView)
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = cartoon.title
        label.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(label)
        
        infoLabels = ["Country", "Genres", "Episodes", "Release Date", "Preview"].map{ info in
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = info
            l.font = UIFont.boldSystemFont(ofSize: 12)
            l.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            return l
        }
        infoLabels.forEach { view.addSubview($0) }
        infoLabels.forEach { constraints.append($0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)) }
        infoLabels.enumerated().forEach { constraints.append($0.offset == 0 ? $0.element.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25) : $0.element.topAnchor.constraint(equalTo: infoLabels[$0.offset - 1].bottomAnchor, constant: 10)) }
        
        contentLabels = [cartoon.country, cartoon.genres.joined(separator: ", "), cartoon.numberOfEpisodes != nil ? String(cartoon.numberOfEpisodes!) : "TBA", cartoon.releaseDate != nil ? DateFormatter().string(from: cartoon.releaseDate!) : "TBA", cartoon.previewLink ?? ""
        ].map { content in
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = content
            l.lineBreakMode = .byCharWrapping
            l.numberOfLines = 0
            l.font = UIFont.systemFont(ofSize: 12)
            l.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
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

}
