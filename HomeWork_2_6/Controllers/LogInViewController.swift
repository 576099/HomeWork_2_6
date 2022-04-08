//
//  LogInViewController.swift
//  HomeWork_2_3
//
//  Created by Александр Смирнов on 25.03.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.contentSize =
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or Phone"
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return textField
    }()
    
    private lazy var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return textField
    }()
    
    let imageButton = UIImage(named: "blue_pixel")
    
    private lazy var loginButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        
        button.setTitleColor(UIColor.init(white: 1, alpha: 1), for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .selected)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .highlighted)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.8), for: .disabled)

        //Set bacground image for button
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: UIControl.State.normal)
        button.clipsToBounds = true
        
        //Target Button for extra task with an asterisk
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        //скрываем заголовок navigationBar именно у этого navigationController
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    private func setupView() {
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.imageView)
        self.scrollView.addSubview(self.textFieldEmail)
        self.scrollView.addSubview(self.textFieldPassword)
        self.scrollView.addSubview(self.loginButton)
        self.view.backgroundColor = .white
        
        let textFields = [self.textFieldEmail, self.textFieldPassword].compactMap({ $0 })
        textFields.forEach { textField in
            //сдвиг текста в TextField
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftViewMode = .always
            //
            textField.backgroundColor = .systemGray6
            textField.font = .systemFont(ofSize: 16)
            textField.autocapitalizationType = .none
            textField.layer.borderWidth = 0.5
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.cornerRadius = 10
            textField.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewCenterXConstraint = self.scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewWidthConstraint = self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
                
        let imageViewTopAnchor = self.imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120)
        let imageViewCenterX = self.imageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let widthImageView = self.imageView.widthAnchor.constraint(equalToConstant: 100)
        let heightImageView = self.imageView.heightAnchor.constraint(equalToConstant: 100)

        //Настройка констрейнтов для textFieldEmail
        let topAnchorTextFieldEmail = self.textFieldEmail.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 120)
        let centerTextFieldEmailX = self.textFieldEmail.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let leadingTextFieldEmail = self.textFieldEmail.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16)
        let trailingTextFieldEmail = self.textFieldEmail.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16)
        let heightTextFieldEmail = self.textFieldEmail.heightAnchor.constraint(equalToConstant: 50)
        
        //Настройка констрейнтов для textFieldPassword
        let topAnchorTextFieldPassword = self.textFieldPassword.topAnchor.constraint(equalTo: self.textFieldEmail.bottomAnchor)
        let leadingTextFieldPassword = self.textFieldPassword.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16)
        let trailingTextFieldPassword = self.textFieldPassword.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16)
        let heightTextFieldPassword = self.textFieldPassword.heightAnchor.constraint(equalToConstant: 50)

        //Настройка констрейнтов для LoginButton
        let topAnchorLoginButtonConstraint = self.loginButton.topAnchor.constraint(equalTo: self.textFieldPassword.bottomAnchor, constant: 16)
        let leadingLoginButtonConstraint = self.loginButton.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16)
        let trailingLoginButtonConstraint = self.loginButton.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16)
        let heightLoginButton = self.loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            scrollViewTopConstraint, scrollViewBottomConstraint, topAnchorTextFieldEmail, centerTextFieldEmailX, leadingTextFieldEmail, trailingTextFieldEmail, heightTextFieldEmail, topAnchorTextFieldPassword, leadingTextFieldPassword, trailingTextFieldPassword, heightTextFieldPassword, topAnchorLoginButtonConstraint, leadingLoginButtonConstraint, trailingLoginButtonConstraint, heightLoginButton, scrollViewCenterXConstraint, scrollViewWidthConstraint, imageViewTopAnchor, imageViewCenterX, widthImageView, heightImageView
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.scrollView.contentInset.bottom = kbdSize.height
            self.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide(notification: NSNotification) {
        self.scrollView.contentInset.bottom = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
    }
    @objc private func buttonTapped() {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        let profileViewController = ProfileViewController()
            show(profileViewController, sender: nil)
    }
}
