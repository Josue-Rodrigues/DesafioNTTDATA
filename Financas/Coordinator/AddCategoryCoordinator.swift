//
//  AddCategoryCoordinator.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 29/03/22.
//

import UIKit

class AddCategoryCoordinator: Coordinator {
    
    private (set) var rootViewController: UIViewController
    private (set) var controller: UINavigationController?
    
    init(root: UIViewController) {
        self.rootViewController = root
    }
    
    func start() {
        
        let viewModel = AddCategoryViewModel()
        let viewController: AddCategoryViewController = .init(viewModel: viewModel)
        rootViewController.present(viewController, animated: true)
    }
}
