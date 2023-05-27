//
//  ProfileHeaderView.swift
//  Novigation
//
//  Created by Евгений Сидоров on 22.05.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 60
        imageView.image = UIImage(named: "max")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private let titleName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Max Payne"
        return label
    }()
    
//    private let pushButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Жми!!!", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .blue
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        
        return button
    }()
    
    var titleStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Скажите что-нибудь..."
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.minimumFontSize = 15
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.placeholder = ""
        return textField
    }()
    
    private var statusText: String = ""
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleName.translatesAutoresizingMaskIntoConstraints = false
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleStatus.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(titleName)
        addSubview(titleStatus)
        addSubview(button)
        addSubview(textField)
//        addSubview(pushButton)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            titleStatus.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            titleStatus.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 15),
            titleStatus.widthAnchor.constraint(equalToConstant: 170),
            titleName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            titleName.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleName.widthAnchor.constraint(equalToConstant: 190),
            textField.topAnchor.constraint(equalTo: titleStatus.bottomAnchor, constant: 12),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 210),
            textField.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            pushButton.heightAnchor.constraint(equalToConstant: 50),pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
//            pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
//            pushButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
        
        ])
    }
    
    @objc func btnPressed() {
        
        print( textField.text ?? "")
        
    }


}
