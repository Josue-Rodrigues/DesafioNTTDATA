//
//  MainTabBarCoordinator.swift
//  Financas
//
//  Created by Josue Herrera Rodrigues on 25/03/22.
//

import UIKit

class MainTabBarCoordinator: Coordinator {
    
    private (set) var rootViewController: UIViewController
    private (set) lazy var masterRootViewController: UINavigationController = .init(rootViewController: rootViewController)
    private var mainTabBar = UITabBarController()
    private let window: UIWindow
    
    private var mainListCoordinator: MainListCoordinator?
    private var categoryCoordinator: CategoryCoordinator?
//    private var addReleaseCoordinator: AddReleaseCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = .init()
    }
    
    func start() {
        
        configureTabBarStyle()
        
        guard let mainListViewController = creatMainListCoordinatorVC() else {return}
        guard let categoryViewController = creatCategoryCoordinatorVC() else {return}
//        guard let testeViewController = creatTesteCoordinatorVC() else {return}
        
        mainTabBar.viewControllers = [mainListViewController, categoryViewController]
        window.rootViewController = mainTabBar
        window.makeKeyAndVisible()
    }
    
    private func creatMainListCoordinatorVC() -> UINavigationController? {
        mainListCoordinator = .init(root: rootViewController)
        mainListCoordinator?.start()
        guard let mainListViewController = mainListCoordinator?.controller else {return nil}
        let mainListImage = UIImage(named: "Lançamentos")
        mainListViewController.tabBarItem = .init(title: "Lançamentos", image: mainListImage, tag: 0)
        
        return mainListViewController
    }
    
    private func creatCategoryCoordinatorVC() -> UINavigationController? {
        categoryCoordinator = .init(root: rootViewController)
        categoryCoordinator?.start()
        guard let categoryViewController = categoryCoordinator?.controller else {return nil}
        let mainListImage = UIImage(named: "Categorias")
        categoryViewController.tabBarItem = .init(title: "Categoria", image: mainListImage, tag: 0)
        
        return categoryViewController
    }
    
//    private func creatTesteCoordinatorVC() -> UINavigationController? {
//
//        addReleaseCoordinator = .init(root: rootViewController)
//        addReleaseCoordinator?.start()
//        guard let testeViewController = addReleaseCoordinator?.controller else {return nil}
//        let mainListImage = UIImage(systemName: "xmark")
//        testeViewController.tabBarItem = .init(title: "TestView", image: mainListImage, tag: 0)
//
//        return testeViewController
//    }
    
    private func configureTabBarStyle() {
        mainTabBar.tabBar.backgroundImage = UIImage()
        mainTabBar.tabBar.shadowImage = UIImage()
        mainTabBar.tabBar.tintColor = .black
        mainTabBar.tabBar.clipsToBounds = true
    }
}
