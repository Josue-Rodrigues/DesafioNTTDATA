//
//  EditCategoryViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 29/03/22.
//

import UIKit

class EditCategoryViewController: UIViewController {
    
    var viewModel: EditCategoryViewModelProtocol
    var editCategoryDetailView: EditCategoryDetailView = EditCategoryDetailView()
    
    override func loadView() {
        self.view = editCategoryDetailView
        self.editCategoryDetailView.validTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Definindo que quem ira gerenciar minha delegate do Textfield será minha propria view
        self.editCategoryDetailView.settingTextFieldDelegate(delegate: self)
        // Instanciando meu Delegate para action do Button
        self.editCategoryDetailView.delegate(delegate: self)
    }
    
    init(viewModel:EditCategoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EditCategoryViewController: EditCategoryDetailViewProtocol {
    
    func actionSaveButton() {
        viewModel.actionSaveButton()
    }
    
    func actionCancelButton() {
        viewModel.actionCancelButton()
    }
}

// Criando uma Extension para implementação do protocolo UITextFieldDelegate
extension EditCategoryViewController: UITextFieldDelegate {
    
    // Informa ao delegate quando a seleção de texto é alterada
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.editCategoryDetailView.validTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    // Informa ao delegate quando a edição é interrompida
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
