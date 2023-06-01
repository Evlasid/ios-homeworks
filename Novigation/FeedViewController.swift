//
//  FeedViewController.swift
//  Novigation
//
//  Created by Евгений Сидоров on 18.05.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        
        return button
    }()
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 50),
            postButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func showPage () {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        postButton.addTarget(self, action: #selector(showPage), for: .touchUpInside)
        view.addSubview(postButton)
        setConstraints()
        
    }
    


}
