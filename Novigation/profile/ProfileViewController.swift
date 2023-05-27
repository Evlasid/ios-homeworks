//
//  ProfileViewController.swift
//  Novigation
//
//  Created by Евгений Сидоров on 18.05.2023.
//
 
import UIKit


class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()

    private let pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Жми!!!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        addLayout()
    }
    
    func addLayout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        view.addSubview(pushButton)


        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            pushButton.heightAnchor.constraint(equalToConstant: 50),pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            pushButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
        ])
        profileHeaderView.frame = view.frame
    }
}
