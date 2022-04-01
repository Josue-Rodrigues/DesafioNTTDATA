//
//  EditReleaseCoordinator.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 31/03/22.
//

import UIKit

class EditReleaseCoordinator: Coordinator {
    
    private (set) var rootViewController: UIViewController
    private (set) var controller: UINavigationController?
    
    init(root: UIViewController) {
        self.rootViewController = root
    }
    
    func start() {
        let viewModel = EditReleaseViewModel()
        let viewController: EditReleaseViewController = .init(viewModel: viewModel)
        rootViewController.present(viewController, animated: true)
    }
    
    func cancel(){
        let viewModel = MainListViewModel()
        let viewController: MainListViewController = .init(viewModel: viewModel)
        
        controller = .init(rootViewController: viewController)
        
        controller?.dismiss(animated: true)
        print("PASSEI AQUI")
    }
}
