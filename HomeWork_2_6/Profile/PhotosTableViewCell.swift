//
//  PhotosTableViewCell.swift
//  HomeWork_2_5
//
//  Created by Александр Смирнов on 07.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        var photoName: String
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()
    
    private lazy var upStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
//        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()
    
    private lazy var downStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        
//        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var labelTextPhoto: UILabel = {
        let labelPhoto = UILabel()
        labelPhoto.text = "Photo"
        labelPhoto.textColor = .black
        labelPhoto.font = .systemFont(ofSize: 24, weight: .bold)
        return labelPhoto
    }()
    
    private lazy var labelTextNext: UILabel = {
        let labelNext = UILabel()
        labelNext.text = "->"
        labelNext.textColor = .black
        labelNext.font = .systemFont(ofSize: 24, weight: .bold)
        return labelNext
    }()
    
    private lazy var screenWidth = (UIScreen.main.bounds.size.width - 48) / 4
    
    private lazy var imageViewPhoto1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "2_5_1")
        
//        imageView.frame.size.height = 50
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: self.screenWidth).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.screenWidth).isActive = true
//        imageView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViewPhoto2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "2_5_2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: self.screenWidth).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.screenWidth).isActive = true
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
//        imageView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var imageViewPhoto3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "2_5_3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: self.screenWidth).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.screenWidth).isActive = true
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
//        imageView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var imageViewPhoto4: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "2_5_4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: self.screenWidth).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: self.screenWidth).isActive = true
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
//        imageView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        imageView.clipsToBounds = true
        return imageView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white

        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.mainStackView)
        
        self.mainStackView.addArrangedSubview(self.upStackView)
        self.mainStackView.addArrangedSubview(self.downStackView)
        self.upStackView.addArrangedSubview(self.labelTextPhoto)
        self.upStackView.addArrangedSubview(self.labelTextNext)
        self.downStackView.addArrangedSubview(self.imageViewPhoto1)
        self.downStackView.addArrangedSubview(self.imageViewPhoto2)
        self.downStackView.addArrangedSubview(self.imageViewPhoto3)
        self.downStackView.addArrangedSubview(self.imageViewPhoto4)
        
        let backViewConstraints = self.backViewConstraints()
        let mainStackViewConstraints = self.mainStackViewConstraints()
        NSLayoutConstraint.activate(backViewConstraints + mainStackViewConstraints)
    }

    private func mainStackViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.mainStackView.topAnchor.constraint(equalTo: self.backView.topAnchor)
        let leadingConstraint = self.mainStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.mainStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let bottomConstraint = self.mainStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
    
    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12)

        return [
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ]
    }
}
