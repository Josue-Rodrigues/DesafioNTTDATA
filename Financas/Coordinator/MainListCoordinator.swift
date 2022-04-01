//
//  mainListCoordinator.swift
//  Financas
//
//  Created by Josué Herrera Rodrigues on 25/03/22.
//

import UIKit

class MainListCoordinator: Coordinator {
    
    private (set) var rootViewController: UIViewController
    private (set) var controller: UINavigationController?
    private var coordinatorAdd: AddReleaseCoordinator?
    private var coordinatorEdit: EditReleaseCoordinator?
    
    init(root: UIViewController) {
        self.rootViewController = root
    }
    
    func start() {
        
        let viewModel = MainListViewModel()
        let viewController: MainListViewController = .init(viewModel: viewModel)
        
        self.coordinatorAdd = AddReleaseCoordinator(root: viewController)
        viewModel.addReleaseCoordinator = coordinatorAdd
        
        self.coordinatorEdit = EditReleaseCoordinator(root: viewController)
        viewModel.editReleaseCoordinator = coordinatorEdit
        
        controller = .init(rootViewController: viewController)
    }
}
