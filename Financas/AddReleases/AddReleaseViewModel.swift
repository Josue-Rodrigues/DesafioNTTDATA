//
//  AddReleaseViewModel.swift
//  Financas
//
//  Created by Josué Herrera Rodrigues on 25/03/22.
//

import UIKit

protocol AddReleaseViewModelProtocol {
    func actionSegmentedControl(sender: UISegmentedControl)
    func actionSelectButton(view: DetailView)
    func actionCancelButtonToolbar(view: DetailView)
    func actionCancelButton()
    func actionSaveButton()
    func loadDataPickerCategory()
    func numberOfRows(component: Int) -> Int
    func titleForRow(row: Int, component: Int) -> String
}

class AddReleaseViewModel {
    
    var alertController:Alert?
    var category:[String] = []
    var addReleaseCoordinator: AddReleaseCoordinator?
    var mainListCoordinator: MainListCoordinator?
    var detailView: DetailView = DetailView()
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
    
    func actionCancelButton() {
        addReleaseCoordinator?.cancel()
        print("Cancelar Novo Lançamento")
        self.alertController?.getAlert(titulo: "ATENÇÃO!!", mensagem: "Deseja realmente cancelar este novo lançamento?", button: "Confirmar", completion: nil)
    }
    
    func actionSelectButton(view: DetailView) {
        view.endEditing(true)
    }
    
    func actionCancelButtonToolbar(view: DetailView) {
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
