//
//  PostViewController.swift
//  Novigation
//
//  Created by Евгений Сидоров on 18.05.2023.
//
import UIKit

class PostViewController: UIViewController {
   
    var postName: String?
    
    lazy var infoRightButton: UIButton = {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "info")?.withRenderingMode(.alwaysTemplate),
            for: .normal)
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    lazy var barBtn: UIBarButtonItem = {
    var buttom = UIBarButtonItem()
        buttom = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(infoRightButtonTapped))
        return buttom
    }()
//
    
    @objc private func infoRightButtonTapped() {
        let infoViewController = InfoViewController()
        present(infoViewController,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        navigationController?.navigationBar.barTintColor = .systemYellow
        navigationItem.rightBarButtonItem = barBtn
        infoRightButton.addTarget(self, action: #selector(infoRightButtonTapped), for: .touchUpInside)

    }
    
    
    

}
