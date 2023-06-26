//
//  PostTableViewCell.swift
//  Novigation
//
//  Created by Евгений Сидоров on 31.05.2023.
//

import UIKit

protocol IncreaseLikeDelegate: AnyObject {
    func increaseLikes( indexPath: IndexPath)
}


class PostTableViewCell: UITableViewCell {
    
    weak var delegate: IncreaseLikeDelegate?
    private var indexPathCell = IndexPath()
    
    private let author: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let likes: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        
        return label
        
    }()
    
    private let views: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let contentLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let postImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addLike() {
        delegate?.increaseLikes(indexPath: indexPathCell)
//        if isLiked == true {
//            likesLabel.text = " ♥ Likes: " + String(posts[indexPathCell.row].likes)
//            likesLabel.textColor = .red
//            posts[indexPathCell.row].isLiked.toggle()
//        } else {
//            likesLabel.text = "Likes: " + String(posts[indexPathCell.row].likes)
//            likesLabel.textColor = .black
//            posts[indexPathCell.row].isLiked.toggle()
//        }
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addLike))
        likes.addGestureRecognizer(tapGesture)
    }
    
    
    func setupCell(model: Post) {
        
        likes.text = "Likes: "
        + String( model.likes)
        
        views.text = "Views: "
        + String(model.views)
        
        postImg.image = UIImage(named: model.image)
        author.text = model.author
        descriptionLabel.text = model.description
    }
    
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    
    
    private func layout() {
        [contentLayer, author,postImg, descriptionLabel, likes, views].forEach { contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            contentLayer.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentLayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentLayer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentLayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            author.topAnchor.constraint(equalTo: contentLayer.topAnchor, constant: 15),
            author.leadingAnchor.constraint(equalTo: contentLayer.leadingAnchor, constant: 20),
            author.trailingAnchor.constraint(equalTo: contentLayer.trailingAnchor, constant: 200),
            author.heightAnchor.constraint(equalToConstant: 30),
            
            postImg.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 25),
            postImg.leadingAnchor.constraint(equalTo: contentLayer.leadingAnchor),
            postImg.trailingAnchor.constraint(equalTo: contentLayer.trailingAnchor),
            postImg.heightAnchor.constraint(equalTo: postImg.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImg.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentLayer.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentLayer.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            
            likes.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likes.leadingAnchor.constraint(equalTo: contentLayer.leadingAnchor, constant: 20),
            likes.heightAnchor.constraint(equalToConstant: 50),
            likes.bottomAnchor.constraint(equalTo: contentLayer.bottomAnchor),
            
            views.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            views.trailingAnchor.constraint(equalTo: contentLayer.trailingAnchor, constant: -20),
            views.heightAnchor.constraint(equalToConstant: 50),
            views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
        ])
    }
}


