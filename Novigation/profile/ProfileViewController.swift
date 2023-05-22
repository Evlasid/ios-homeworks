//
//  ProfileViewController.swift
//  Novigation
//
//  Created by Евгений Сидоров on 18.05.2023.
//
 
import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        addLayout()
    }
    
    func addLayout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        profileHeaderView.frame = view.frame
    }
}
