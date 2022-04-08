//
//  MyTabBarController.swift
//  UIBaseComponents
//
//  Created by Александр Смирнов on 16.03.2022.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navTabOne = generatedNavigationController(vc: FeedViewController(), title: "Лента", image: UIImage(systemName: "house"))
        let navTabTwo = generatedNavigationController(vc: LogInViewController(), title: "Профиль", image: UIImage(systemName: "person.circle"))
        let navTabThree = generatedNavigationController(vc: GesturesViewController(), title: "Жесты", image: UIImage(systemName: "person"))
        UINavigationBar.appearance().prefersLargeTitles = false
        self.viewControllers = [navTabOne, navTabTwo, navTabThree]
    }
    
    fileprivate func generatedNavigationController(vc: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        vc.navigationItem.title = title
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
