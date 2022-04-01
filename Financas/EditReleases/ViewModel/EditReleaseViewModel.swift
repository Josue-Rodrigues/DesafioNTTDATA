//
//  EditReleaseViewModel.swift
//  Financas
//
//  Created by Valeria Moreira pereira rodrigues on 31/03/22.
//

import UIKit

protocol EditReleaseViewModelProtocol {
    func actionSegmentedControl(sender: UISegmentedControl)
    func actionSelectButton(view: EditReleaseDetailView)
    func actionCancelButtonToolbar(view: EditReleaseDetailView)
    func actionCancelButton()
    func actionSaveButton()
    func loadDataPickerCategory()
    func numberOfRows(component: Int) -> Int
    func titleForRow(row: Int, component: Int) -> String
}

class EditReleaseViewModel {
    
    var category:[String] = []
    var editReleaseCoordinator: EditReleaseCoordinator?
    var detailView: DetailView = DetailView()
}

extension EditReleaseViewModel: EditReleaseViewModelProtocol {
    
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
    
    func actionCancelButton() {
        editReleaseCoordinator?.cancel()
        print("Cancelar Novo Lançamento")
    }
    
    func actionSelectButton(view: EditReleaseDetailView) {
        view.endEditing(true)
//        detailView.validTextField()
    }
    
    func actionCancelButtonToolbar(view: EditReleaseDetailView) {
//        detailView.textFieldDate.text = ""
//        detailView.textFieldCategory.text = ""
        view.endEditing(true)
        
        print("VIEW MODEL")
    }
    
    func actionSaveButton() {
        print("Salvar Novo Lançamento")
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
