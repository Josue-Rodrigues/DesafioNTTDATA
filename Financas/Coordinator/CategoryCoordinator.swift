//
//  CategoryCoordinator.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 25/03/22.
//

import UIKit

class CategoryCoordinator: Coordinator {
    
    private (set) var rootViewController: UIViewController
    private (set) var controller: UINavigationController?
    private var coordinator: AddCategoryCoordinator?
    
    init(root: UIViewController) {
        self.rootViewController = root
    }
    
    func start() {
        let viewModel = CategoryViewModel()
        let viewController: CategoryViewController = .init(viewModel: viewModel)
        self.coordinator = AddCategoryCoordinator(root: viewController)
        viewModel.addCategoryCoordinator = coordinator
        controller = .init(rootViewController: viewController)
    }
}
