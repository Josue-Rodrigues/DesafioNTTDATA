//
//  EditCategoryViewModel.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 29/03/22.
//

import UIKit

protocol EditCategoryViewModelProtocol {
    func actionSaveButton()
    func actionCancelButton()
}

class EditCategoryViewModel {
    
}

extension EditCategoryViewModel: EditCategoryViewModelProtocol {
    
    func actionSaveButton() {
        print("Salvar Nova categoria")
    }
    
    func actionCancelButton() {
        print("Cancelar Nova categoria")
    }
}
