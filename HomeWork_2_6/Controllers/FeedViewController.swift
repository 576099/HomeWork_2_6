//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр Смирнов on 25.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

//    let myPost = Post(title: "Новый заголовок!")
    
    private lazy var stackOneButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setTitle("Stack Button 1", for: .normal)
        return button
    }()
    private lazy var stackTwoButton: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.setTitle("Stack Button 2", for: .normal)
        // скручивание определенных углов Вью
//        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return button
    }()
    
    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupView()
    }
    
    private func setupView() {
        self.stackViewVertical.addArrangedSubview(stackOneButton)
        self.stackViewVertical.addArrangedSubview(stackTwoButton)
        self.view.addSubview(stackViewVertical)
        self.stackViewVertical.spacing = 10
        
        let buttons = [self.stackOneButton, self.stackTwoButton].compactMap({ $0 })
        
        buttons.forEach { button in
            button.clipsToBounds = true
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapStackButtons(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 12
            //настройка тени под кнопкой с помощью слоя CALayer
            button.layer.masksToBounds = false
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            button.layer.shadowRadius = 4.0
            button.layer.shadowOpacity = 0.7

        }
        //Setup Stack constraints
        let centerStackX = self.stackViewVertical.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let centerStackY = self.stackViewVertical.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let heightStack = self.stackViewVertical.heightAnchor.constraint(equalToConstant: 110)
        let weidthStack = self.stackViewVertical.widthAnchor.constraint(equalToConstant: 150)
        
        //Active Stack Constraints
        NSLayoutConstraint.activate([
            centerStackX, centerStackY, heightStack, weidthStack
        ].compactMap({ $0 }))

    }
    
    @objc private func didTapStackButtons(_ sender: UIButton) {
        if sender.tag == 1 {
            let pvcPush = PostViewController()
            pvcPush.title = "myPost.title"
            self.navigationController?.pushViewController(pvcPush, animated: true)

        } else if sender.tag == 2 {
            let pvcPresent = PostViewController()
            self.navigationController?.present(pvcPresent, animated: true, completion: nil)

        }
    }
}

