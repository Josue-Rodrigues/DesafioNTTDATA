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

        self.setViewControllers([mainVC, categoryVC], animated: false)
        
        self.tabBar.tintColor = .black
    }
}
