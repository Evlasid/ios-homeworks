//
//  PhotosTableViewCell.swift
//  Novigation
//
//  Created by Евгений Сидоров on 07.06.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let header: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Photo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let wraplayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
        return view
    }()
    
    private let arrowRight: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image =  UIImage(systemName: "arrow.right")
        return imageView
    }()
    
    private let imageView1: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView2: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView3: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageView4: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "4")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        contentView.addSubview(wraplayer)
        contentView.addSubview(imageView1)
        contentView.addSubview(imageView2)
        contentView.addSubview(imageView3)
        contentView.addSubview(imageView4)
        contentView.addSubview(header)
        contentView.addSubview(arrowRight)
    }
    
    private func setupContraints() {
        let imageSize = (UIScreen.main.bounds.width - 50) / 4
        
        NSLayoutConstraint.activate([
            
            header.topAnchor.constraint(equalTo: wraplayer.topAnchor ,constant: 12),
            header.leadingAnchor.constraint(equalTo: wraplayer.leadingAnchor,constant: 12),
            
            imageView1.widthAnchor.constraint(equalToConstant: imageSize),
            imageView1.heightAnchor.constraint(equalToConstant: imageSize),
            imageView1.topAnchor.constraint(equalTo: header.bottomAnchor,constant: 12),
            imageView1.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 10),
            
            imageView2.widthAnchor.constraint(equalToConstant: imageSize),
            imageView2.heightAnchor.constraint(equalToConstant: imageSize),
            imageView2.topAnchor.constraint(equalTo: header.bottomAnchor,constant: 12),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor,constant: 10),
            
            imageView3.widthAnchor.constraint(equalToConstant: imageSize),
            imageView3.heightAnchor.constraint(equalToConstant: imageSize),
            imageView3.topAnchor.constraint(equalTo: header.bottomAnchor,constant: 12),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor,constant: 10),
            
            imageView4.widthAnchor.constraint(equalToConstant: imageSize),
            imageView4.heightAnchor.constraint(equalToConstant: imageSize),
            imageView4.topAnchor.constraint(equalTo: header.bottomAnchor,constant: 12),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor,constant: 10),
            imageView4.bottomAnchor.constraint(equalTo: wraplayer.bottomAnchor, constant: -12),
            
            arrowRight.widthAnchor.constraint(equalToConstant: 20),
            arrowRight.trailingAnchor.constraint(equalTo: wraplayer.trailingAnchor, constant: -15),
            arrowRight.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            
            wraplayer.topAnchor.constraint(equalTo: contentView.topAnchor),
            wraplayer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            wraplayer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor ),
            wraplayer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            //            wraplayer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    

    

}

