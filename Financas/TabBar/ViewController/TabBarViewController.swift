//
//  TabBarViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodrigues on 22/03/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    var mainViewController: MainViewController?
    var categoryViewController: CategoryViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainVC = MainViewController()
        let categoryVC = CategoryViewController()

        mainVC.title = "Lançamentos"
        categoryVC.title = "Categoria"
        
        categoryVC.tabBarItem.image = UIImage(systemName: "Lançamentos")
        categoryVC.tabBarItem.image = UIImage(systemName: "Categorias")

        self.setViewControllers([mainVC, categoryVC], animated: false)
        
//        guard let items = self.tabBar.items else { return }
//
//        let images = ["Lançamentos", "Categorias"]
//
//        for x in 0...1 {
//
//            items[x].image = UIImage(systemName: images[x])
//        }
        
        self.tabBar.tintColor = .black
    }
}
