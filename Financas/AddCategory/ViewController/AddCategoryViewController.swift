//
//  AddCategoryViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 29/03/22.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    var viewModel: AddCategoryViewModelProtocol
    var addCategoryDetailView: AddCategoryDetailView = AddCategoryDetailView()
    
    override func loadView() {
        self.view = addCategoryDetailView
        self.addCategoryDetailView.validTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Definindo que quem ira gerenciar minha delegate do Textfield será minha propria view
        self.addCategoryDetailView.settingTextFieldDelegate(delegate: self)
        // Instanciando meu Delegate para action do Button
        self.addCategoryDetailView.delegate(delegate: self)
    }
    
    init(viewModel:AddCategoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddCategoryViewController: AddCategoryDetailViewProtocol {
    
    func actionSaveButton() {
        viewModel.actionSaveButton()
    }
    
    func actionCancelButton() {
        viewModel.actionCancelButton()
    }
}

// Criando uma Extension para implementação do protocolo UITextFieldDelegate
extension AddCategoryViewController: UITextFieldDelegate {
    
    // Informa ao delegate quando a seleção de texto é alterada
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.addCategoryDetailView.validTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    // Informa ao delegate quando a edição é interrompida
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
