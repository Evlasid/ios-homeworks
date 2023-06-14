//
//  ProfileHeaderView.swift
//  Novigation
//
//  Created by Евгений Сидоров on 22.05.2023.
//


import UIKit
class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private lazy var closeBtn: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image =  UIImage(systemName: "xmark.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClose)))
        return imageView
    }()
    
    private let avatarWrap: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let layerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.isHidden = true
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "max")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOpen)))
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var  button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusTextFeld: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.minimumFontSize = 15
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.placeholder = "status..."
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var leadingImageView = NSLayoutConstraint()
    private var trailingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()
    private var widthImageView = NSLayoutConstraint()
    private var heightImageView = NSLayoutConstraint()
    private var heightWrapView = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(button)
        addSubview(statusTextFeld)
        addSubview(avatarWrap)
        addSubview(layerView)
        addSubview(imageView)
        addSubview(closeBtn)
    }
    
    private  func setupLayoutConstraint() {
        
        leadingImageView = imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topImageView = imageView.topAnchor.constraint(equalTo: topAnchor,constant: 16)
        widthImageView = imageView.widthAnchor.constraint(equalToConstant: 95)
        heightImageView = imageView.heightAnchor.constraint(equalToConstant: 95)
        NSLayoutConstraint.activate([leadingImageView, topImageView, widthImageView, heightImageView])
        
        heightWrapView = layerView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([heightWrapView])
        
        NSLayoutConstraint.activate([
            
            layerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            layerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            layerView.topAnchor.constraint(equalTo: topAnchor),
            
            closeBtn.widthAnchor.constraint(equalToConstant: 30),
            closeBtn.heightAnchor.constraint(equalToConstant: 30),
            closeBtn.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            avatarWrap.widthAnchor.constraint(equalToConstant: 95),
            avatarWrap.heightAnchor.constraint(equalToConstant: 95),
            avatarWrap.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            avatarWrap.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            titleLabel.leadingAnchor.constraint(equalTo: avatarWrap.trailingAnchor,constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            titleLabel.topAnchor.constraint(equalTo: avatarWrap.topAnchor ,constant: 0),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtitleLabel.widthAnchor.constraint(equalToConstant: 150),

            button.topAnchor.constraint(equalTo: statusTextFeld.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),

            statusTextFeld.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            statusTextFeld.heightAnchor.constraint(equalToConstant: 40),
            statusTextFeld.widthAnchor.constraint(equalToConstant: 200),
            statusTextFeld.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            statusTextFeld.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    @objc func buttonPressed() {
        
        if let text =  statusTextFeld.text {
            subtitleLabel.text = text
            if subtitleLabel.text == "" {
                subtitleLabel.text = " "
            }
            print(text)}
    }
    @objc private func tapOpen() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {
                self.widthImageView.constant = UIScreen.main.bounds.width - 60
                self.leadingImageView.constant = 30
                self.trailingImageView.constant = 30
                self.topImageView.constant = 30
                self.heightImageView.constant = UIScreen.main.bounds.height - 220
                self.heightWrapView.constant =  UIScreen.main.bounds.height
                self.imageView.layer.cornerRadius = 0
                self.layerView.isHidden = false
                self.closeBtn.layer.opacity = 1
                self.layerView.layer.opacity = 0.3
            }
        }
    }
    
    @objc private func tapClose() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.closeBtn.layer.opacity = 0
                self.layerView.layer.opacity = 0
                self.layerView.isHidden = false
                self.layerView.isHidden = true
                self.imageView.layer.cornerRadius = 50
                self.widthImageView.constant = 95
                self.leadingImageView.constant = 16
                self.trailingImageView.constant = 30
                self.topImageView.constant = 16
                self.heightImageView.constant = 95
                self.heightWrapView.constant =  UIScreen.main.bounds.height
            }
        }
    }
}
