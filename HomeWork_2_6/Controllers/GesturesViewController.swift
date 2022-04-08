//
//  GesturesViewController.swift
//  HomeWork_2_6
//
//  Created by Александр Смирнов on 08.04.2022.
//

import UIKit

class GesturesViewController: UIViewController {
    
    private lazy var screenWidth = UIScreen.main.bounds.size.width
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private var myViewCenterXConstraint: NSLayoutConstraint?
    private var myViewCenterYConstraint: NSLayoutConstraint?
    private var myViewWidth: NSLayoutConstraint?
    private var myViewHeight: NSLayoutConstraint?
    
    private var isExpanded = false
    
    private var cornerRadiusViewImage: CGFloat?

    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()
    
    private lazy var myView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        view.isHidden = true
        view.backgroundColor = .systemGray
        return view
    }()

    private lazy var closeBackViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.isHidden = true
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
    }

    private func setupView() {
        self.view.backgroundColor = .white

        self.view.addSubview(self.myView)
        self.view.addSubview(self.backView)
        self.view.bringSubviewToFront(self.myView)
        self.myView.addSubview(self.logoImageView)
        self.backView.addSubview(closeBackViewButton)
        
        self.myViewCenterXConstraint = self.myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.myViewCenterYConstraint = self.myView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        self.myViewWidth = self.myView.widthAnchor.constraint(equalToConstant: 100)
        self.myViewHeight = self.myView.heightAnchor.constraint(equalToConstant: 100)
        
        let backViewCenterXConstraint = self.backView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let backViewCenterYConstraint = self.backView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let backViewWidth = self.backView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        let backViewHeight = self.backView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        
        let logoImageTopConstraint = self.logoImageView.topAnchor.constraint(equalTo: self.myView.topAnchor)
        let logoImageLeftConstraint = self.logoImageView.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor)
        let logoImageRightConstraint = self.logoImageView.trailingAnchor.constraint(equalTo: self.myView.trailingAnchor)
        let logoImageBottomConstraint = self.logoImageView.bottomAnchor.constraint(equalTo: self.myView.bottomAnchor)
        
        let buttonTopConstraint = self.closeBackViewButton.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 70)
        let buttonRightConstraint = self.closeBackViewButton.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -20)
        let buttonWidthConstraint = self.closeBackViewButton.widthAnchor.constraint(equalToConstant: 50)
        let buttonHeightConstraint = self.closeBackViewButton.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([
            self.myViewCenterXConstraint, self.myViewCenterYConstraint, self.myViewWidth, self.myViewHeight, logoImageTopConstraint, logoImageLeftConstraint, logoImageRightConstraint, logoImageBottomConstraint, backViewCenterXConstraint, backViewCenterYConstraint, backViewWidth, backViewHeight, buttonTopConstraint, buttonRightConstraint, buttonWidthConstraint, buttonHeightConstraint
        ].compactMap({ $0 }))
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.myView.addGestureRecognizer(self.tapGestureRecognizer)
        
        
    }
    
    @objc private func handleTapGesture(_ gestureReecognizer: UITapGestureRecognizer) {
        
        guard self.tapGestureRecognizer === gestureReecognizer else { return }
        //Проверка на возможность нажатия на Вью для последующего изменения рамеров в первоначальное состояние
        if !self.isExpanded {
            
            self.isExpanded.toggle()
            
//            self.myViewWidth?.constant = self.isExpanded ? self.screenWidth : 100
//            self.myViewHeight?.constant = self.isExpanded ? self.screenWidth : 100
            self.myViewWidth?.constant = self.screenWidth
            self.myViewHeight?.constant = self.screenWidth
            
            self.backView.isHidden = false
            self.closeBackViewButton.isHidden = false
            
            UIImageView.animate(withDuration: 0.5) {
                self.backView.alpha = self.isExpanded ? 1 : 0
                self.logoImageView.layer.cornerRadius = self.isExpanded ? 0 : 50
                self.logoImageView.clipsToBounds = false
                self.view.layoutIfNeeded()
            } completion: { _ in
                UIImageView.animate(withDuration: 0.3) {
                    self.closeBackViewButton.alpha = self.isExpanded ? 1 : 0
                    self.view.layoutIfNeeded()
                } completion: { _ in
                    
                }
            }
        }
    }
    
    @objc private func didTapCloseButton() {
        self.isExpanded.toggle()
        self.myViewWidth?.constant = self.isExpanded ? self.screenWidth : 100
        self.myViewHeight?.constant = self.isExpanded ? self.screenWidth : 100
        
        if !self.isExpanded {
            self.backView.isHidden = true
            self.closeBackViewButton.isHidden = true
        }
        
        UIImageView.animate(withDuration: 0.5) {
            self.backView.alpha = self.isExpanded ? 1 : 0
            self.closeBackViewButton.alpha = self.isExpanded ? 1 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.logoImageView.layer.cornerRadius = 50
        }
    }

}
