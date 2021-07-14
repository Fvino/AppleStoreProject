//
//  SceneDelegate.swift
//  AppleStoreProject
//
//  Created by Valeriy Fomin on 9/7/21.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        let buyVC = BuyViewController()
        let forYouVC = ForYouViewController()
        let findVC = FindViewController()
        let basketVC = BasketViewController()
//        let webDetailsVC = WebDetailsViewController()

        let buyNavController = UINavigationController(rootViewController: buyVC)
        let forYouNavController = UINavigationController(rootViewController: forYouVC)
        let findNavController = UINavigationController(rootViewController: findVC)
        let basketNavController = UINavigationController(rootViewController: basketVC)

        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([buyNavController, forYouNavController, findNavController, basketNavController],
                                    animated: true)
        tabBarVC.tabBar.barTintColor = .black
        tabBarVC.tabBar.unselectedItemTintColor = .systemGray5

        buyVC.tabBarItem = UITabBarItem(title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone"),
                                        tag: 0)
        forYouVC.tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "person.crop.circle.fill"),
                                           tag: 1)
        findVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        basketVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "bag"), tag: 3)

        buyNavController.navigationBar.barTintColor = .black
        forYouNavController.navigationBar.barTintColor = .black
        findNavController.navigationBar.barTintColor = .black
        basketNavController.navigationBar.barTintColor = .black
//        webDetailsVC.view.backgroundColor = .black

        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()

        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

