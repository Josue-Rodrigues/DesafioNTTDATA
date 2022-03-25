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

}

extension CategoryViewModel: CategoryViewModelProtocol {
    func tappedAddCategoryButton() {
        print("BOTÃO ADICIONAR CATEGORIA CLICADO")
    }
}
