//
//  AddCategoryViewModel.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 29/03/22.
//

import UIKit

protocol AddCategoryViewModelProtocol {
    func actionSaveButton()
    func actionCancelButton()
}

class AddCategoryViewModel {
    
}

extension AddCategoryViewModel: AddCategoryViewModelProtocol {
    
    func actionSaveButton() {
        print("Salvar Nova categoria")
    }
    
    func actionCancelButton() {
        print("Cancelar Nova categoria")
    }
}
