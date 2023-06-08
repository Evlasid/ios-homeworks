//
//  SceneDelegate.swift
//  Novigation
//
//  Created by Евгений Сидоров on 15.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
      
        let profileViewcontroller = ProfileViewController()

        let profileNovigationViewController = UINavigationController(rootViewController: profileViewcontroller)
        profileNovigationViewController.tabBarItem.title = "Профиль"
        profileNovigationViewController.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")

        let logInViewController = LogInViewController()
        let loginNovigationViewController = UINavigationController(rootViewController: logInViewController)
        loginNovigationViewController.tabBarItem.title = "Профиль"
        loginNovigationViewController.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")

       
        let feedViewController = FeedViewController()
        let feedNovigationViewController = UINavigationController(rootViewController: feedViewController)
        feedNovigationViewController.tabBarItem.title = "Новости"
        feedNovigationViewController.tabBarItem.image = UIImage(systemName: "note.text")
        
        let tabViewController = UITabBarController()
        
        tabViewController.viewControllers = [loginNovigationViewController, feedNovigationViewController]
        tabViewController.tabBar.backgroundColor = UIColor.systemGray
        tabViewController.tabBar.tintColor = UIColor.systemTeal
        
        window.rootViewController =  tabViewController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}
