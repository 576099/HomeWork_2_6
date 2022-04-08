//
//  PostViewController.swift
//  UIBaseComponents
//
//  Created by Александр Смирнов on 16.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(setColor))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func setColor() {
        
        let ivc = InfoViewController()
        self.present(ivc, animated: true, completion: nil)
    }


}
