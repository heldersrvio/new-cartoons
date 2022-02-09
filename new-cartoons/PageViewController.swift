//
//  PageViewController.swift
//  new-cartoons
//
//  Created by Helder on 02/08/2022.
//

import UIKit

class PageViewController: UIPageViewController {
    let cartoons: [Cartoon] = [
        Cartoon(title: "Central Park", genres: ["sitcom", "musical"], country: "United States", numberOfEpisodes: 18, picture: "centralpark-1", releaseDate: nil, previewLink: "https://en.wikipedia.org/wiki/Central_Park_(TV_series)"),
        Cartoon(title: "Craig of the Creek", genres: ["slice of life", "adventure", "comedy"], country: "United States", numberOfEpisodes: 130, picture: "craig", releaseDate: nil, previewLink: "https://en.wikipedia.org/wiki/Craig_of_the_Creek")
    ]
    var currentPage = 0

    func makeVC(with page: Int) -> UIViewController {
        let vc = CardContainerViewController(with: page)
        vc.view.backgroundColor = .blue
        let cartoonCardViewController = CartoonCardViewController(for: cartoons[page])
        vc.addChild(cartoonCardViewController)
        cartoonCardViewController.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(cartoonCardViewController.view)
        
        NSLayoutConstraint.activate([
            cartoonCardViewController.view.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            cartoonCardViewController.view.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor),
            cartoonCardViewController.view.widthAnchor.constraint(equalTo: vc.view.widthAnchor, multiplier: 0.9),
            cartoonCardViewController.view.heightAnchor.constraint(equalTo: vc.view.heightAnchor, multiplier: 0.75)
        ])
        
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        setViewControllers([makeVC(with: 0)], direction: .forward, animated: true, completion: nil)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let cartoonCardVC = viewController as? CardContainerViewController else { return nil }
        
        if (cartoonCardVC.page == 0) {
            return nil
        } else {
            return makeVC(with: cartoonCardVC.page - 1)
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let cartoonCardVC = viewController as? CardContainerViewController else { return nil }
        
        if (cartoonCardVC.page == cartoons.count - 1) {
            return nil
        } else {
            return makeVC(with: cartoonCardVC.page + 1)
        }
    }
        
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cartoons.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentPage
    }
}
