//
//  InfoViewController.swift
//  UIBaseComponents
//
//  Created by Александр Смирнов on 16.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var infoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("Alert Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapTransitionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(self.infoButton)
        self.activateConstraints()

    }
    
    private func activateConstraints() {

        self.infoButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        self.infoButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.infoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.infoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didTapTransitionButton() {
        let actionController = UIAlertController(title: "Alert", message: "This is my ALERT", preferredStyle: .alert)
        let alertActionOk = UIAlertAction (title: "OK", style: .default) { (action) in
            print("OK")
        }
        let alertActionCancel = UIAlertAction (title: "Cancel", style: .default) { (action) in
            print("Cancel")
        }
        
        actionController.addAction(alertActionOk)
        actionController.addAction(alertActionCancel)
        self.present(actionController, animated: true, completion: nil)
    }
}
