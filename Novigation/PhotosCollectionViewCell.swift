//
//  PhotosCollectionViewCell.swift
//  Novigation
//
//  Created by Евгений Сидоров on 07.06.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func tapImageInCell(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCellDelegate?
    private var indexPathCell = IndexPath()
    
     lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func setupCell() {
    }
    
    func setupCell(model: CollectionData) {
        imageView.image = UIImage(named: model.image)
    }
    
    private func addSubviews(){
        contentView.addSubview(imageView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    @objc private func tapAction() {
        delegate?.tapImageInCell(imageView.image, frameImage: imageView.frame, indexPath: indexPathCell)
    }
}
