//
//  AddReleaseViewModel.swift
//  Financas
//
//  Created by Josué Herrera Rodrigues on 25/03/22.
//

import UIKit

protocol AddReleaseViewModelProtocol {
    func actionSegmentedControl(sender: UISegmentedControl)
    func actionSaveButton()
    func actionCancelButton()
    func loadDataPickerCategory()
    func numberOfRows(component: Int) -> Int
    func titleForRow(row: Int, component: Int) -> String
}

class AddReleaseViewModel {
    
    var category:[String] = []
}

extension AddReleaseViewModel: AddReleaseViewModelProtocol {
    func actionSegmentedControl(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            print("Entrada - SegmentedControll")

        case 1:
            print("Saida - SegmentedControll")

        default:
            print("SegmentedControl")
        }
    }
    
    func actionSaveButton() {
        print("Salvar Novo Lançamento")
    }
    
    func actionCancelButton() {
        print("Cancelar Novo Lançamento")
    }
    
    func loadDataPickerCategory() {
        self.category = ["", "Categoria 01", "Categoria 02", "Categoria 03", "Categoria 04", "Categoria 05", "Categoria 06", "Categoria 07", "Categoria 08", "Categoria 09", "Categoria 10"]
    }
    
    func numberOfRows(component: Int) -> Int {
        return category.count
    }
    
    func titleForRow(row: Int, component: Int) -> String {
        return category[row]
    }
}
