//
//  EditCategoryCoordinator.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 31/03/22.
//

import UIKit

class EditCategoryCoordinator: Coordinator {
    
    private (set) var rootViewController: UIViewController
    private (set) var controller: UINavigationController?
    
    init(root: UIViewController) {
        self.rootViewController = root
    }
    
    func start() {
        let viewModel = EditCategoryViewModel()
        let viewController: EditCategoryViewController = .init(viewModel: viewModel)
        rootViewController.present(viewController, animated: true)
    }
}

