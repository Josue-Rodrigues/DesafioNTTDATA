//
//  CategoryViewModel.swift
//  Financas
//
//  Created by Josué Herrera Rodrigues on 24/03/22.
//

import UIKit

protocol CategoryViewModelProtocol {
    func tappedAddCategoryButton()
}

class CategoryViewModel {
    
//    var coordinator: MainCoordinatorProtocol
//    
//    init(coordinator: MainCoordinatorProtocol) {
//        self.coordinator = coordinator
//    }
}

extension CategoryViewModel: CategoryViewModelProtocol {
    func tappedAddCategoryButton() {
        print("BOTÃO ADICIONAR CATEGORIA CLICADO")
    }
}
