//
//  PhotosCollectionViewCell.swift
//  HomeWork_2_5
//
//  Created by Александр Смирнов on 07.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let image: String
    }
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.photoImageView)
        let topConstraint = self.photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leftConstraint = self.photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let rightConstraint = self.photoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        NSLayoutConstraint.activate([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

extension PhotosCollectionViewCell: SetupImagesProtocol {
    
    func setupImage(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }        
        self.photoImageView.image = UIImage(named: viewModel.image)
    }
}
