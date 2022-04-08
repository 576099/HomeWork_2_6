//
//  ProfileHeaderView.swift
//  UIBaseComponents
//
//  Created by Александр Смирнов on 16.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "gdun")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Gdun"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14.0, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
      
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        //Target Button for extra task with an asterisk
        button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = false

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        drawSelf()
    }
    
    private func drawSelf() {
        
        //Added sub view elements to ProfileHeaderView
        self.addSubview(self.imageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.statusButton)
        self.addSubview(self.statusLabel)
        
        //Added Text Field in ProfileHeaderView for extra task with an asterisk
        self.addSubview(self.textField)
        
        //Setup constreit ImageView
        let topAnchorImageView = self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingImageView = self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let widthImageView = self.imageView.widthAnchor.constraint(equalToConstant: 100)
        let heightImageView = self.imageView.heightAnchor.constraint(equalToConstant: 100)
        
        //Set corner radius to Image View
        imageView.layer.cornerRadius = (widthImageView.constant / 2)
        
        //Setup constreit NameLabel
        let topAnchorNameLabel = self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let leadingNameLabel = self.nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10)
        let trailingNameLabel = self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let heightNameLabel = self.nameLabel.heightAnchor.constraint(equalToConstant: 25)

        //Setup constraint statusLabel
        let topAnchorStatusLabel = self.statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16)
        let leadingStatusLabel = self.statusLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10)
        let trailingStatusLabel = self.statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let heightStatusLabel = self.statusLabel.heightAnchor.constraint(equalToConstant: 25)
        
        //Setup constraint textField
        let topAnchorTextField = self.textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10)
        let leadingTextField = self.textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10)
        let trailingTextField = self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let heightTextField = self.textField.heightAnchor.constraint(equalToConstant: 40)
        
        //Setup constraint statusButton
        let topAnchorStatusButton = self.statusButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16)
        let leadingStatusButton = self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingStatusButton = self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let heightStatusButton = self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        
        //Activated constraints
        NSLayoutConstraint.activate([
            topAnchorImageView, leadingImageView, widthImageView, heightImageView, topAnchorNameLabel, leadingNameLabel, trailingNameLabel, heightNameLabel, topAnchorStatusButton, leadingStatusButton, trailingStatusButton, heightStatusButton, topAnchorStatusLabel, leadingStatusLabel, trailingStatusLabel, heightStatusLabel, topAnchorTextField, leadingTextField, trailingTextField, heightTextField
        ].compactMap({ $0 }))

    }
    
    @objc private func buttonPressed() {
        statusTextChanged(self.textField)
        self.statusLabel.text = self.statusText
        
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let statusText = self.textField.text else {
            return print("Text Field text is empty!")
        }
        
        self.statusText = statusText
        print(self.statusText)
    }
}
