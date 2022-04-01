//
//  EditReleaseViewController.swift
//  Financas
//
//  Created by Valeria Moreira pereira rodrigues on 31/03/22.
//

import UIKit

class EditReleaseViewController: UIViewController {
    
    var editReliaseDetailView: EditReleaseDetailView = EditReleaseDetailView()
    var viewModel: EditReleaseViewModelProtocol
    
    override func loadView() {
        self.view = editReliaseDetailView
        self.editReliaseDetailView.validTextField()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Instacinando o delegate e DataSource da PickerView
        self.settingPickerViewProtocols(delegate: self, dataSource: self)
        // Definindo que quem ira gerenciar minha delegate do Textfield será minha propria view
        self.editReliaseDetailView.settingTextFieldDelegate(delegate: self)
        // Instanciando meu Delegate para action do Button
        self.editReliaseDetailView.delegate(delegate: self)
        // Inicializando a ToolBarPicker
        self.editReliaseDetailView.creatToolBarPicker()
        // Carregando os dados da PickerCategory
        self.viewModel.loadDataPickerCategory()
    }
    
    init(viewModel:EditReleaseViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func settingPickerViewProtocols(delegate:UIPickerViewDelegate, dataSource:UIPickerViewDataSource) {
        self.editReliaseDetailView.pickerView.delegate = delegate
        self.editReliaseDetailView.pickerView.dataSource = dataSource
    }
}

extension EditReleaseViewController: EditReleaseDetailViewProtocol {
    
    func actionSegmentedControl(sender: UISegmentedControl) {
        viewModel.actionSegmentedControl(sender: sender)
    }
    
    func actionSelectButton(view: EditReleaseDetailView) {
        viewModel.actionSelectButton(view: view)
    }
    
    func actionCancelButtonToolbar(view: EditReleaseDetailView) {
        viewModel.actionCancelButtonToolbar(view: view)
//        detailView.textFieldDate.text = ""
//        detailView.textFieldCategory.text = ""
    }
    
    func actionSaveButton() {
        viewModel.actionSaveButton()
    }
    
    func actionCancelButton() {
        viewModel.actionCancelButton()
    }
}

extension EditReleaseViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.numberOfRows(component: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.titleForRow(row: row, component: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        editReliaseDetailView.textFieldCategory.text = viewModel.titleForRow(row: row, component: component)
    }
}

// Criando uma Extension para implementação do protocolo UITextFieldDelegate
extension EditReleaseViewController: UITextFieldDelegate {
    
    // Informa ao delegate quando a seleção de texto é alterada
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.editReliaseDetailView.validTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    // Informa ao delegate quando a edição é interrompida
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
