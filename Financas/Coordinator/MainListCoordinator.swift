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
    
    init(root: UIViewController) {
        self.rootViewController = root
    }
    
    func start() {
        let viewModel = MainListViewModel()
        let viewController: MainListViewController = .init(viewModel: viewModel)
        controller = .init(rootViewController: viewController)
    }
}
