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
    private var coordinatorAdd: AddCategoryCoordinator?
    private var coordinatorEdit: EditCategoryCoordinator?
    
    init(root: UIViewController) {
        self.rootViewController = root
    }
    
    func start() {
        let viewModel = CategoryViewModel()
        let viewController: CategoryViewController = .init(viewModel: viewModel)
        
        self.coordinatorAdd = AddCategoryCoordinator(root: viewController)
        viewModel.addCategoryCoordinator = coordinatorAdd
        
        self.coordinatorEdit = EditCategoryCoordinator(root: viewController)
        viewModel.editCategoryCoordinator = coordinatorEdit
        
        controller = .init(rootViewController: viewController)
    }
}
