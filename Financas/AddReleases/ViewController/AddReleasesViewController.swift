//
//  AddReleasesViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 25/03/22.
//

import UIKit

class AddReleasesViewController: UIViewController {
    
    var detailView: DetailView = DetailView()
    var viewModel: AddReleaseViewModelProtocol
    
    override func loadView() {
        self.view = detailView
        self.detailView.validTextField()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Instacinando o delegate e DataSource da PickerView
        self.settingPickerViewProtocols(delegate: self, dataSource: self)
        // Definindo que quem ira gerenciar minha delegate do Textfield será minha propria view
        self.detailView.settingTextFieldDelegate(delegate: self)
        // Instanciando meu Delegate para action do Button
        self.detailView.delegate(delegate: self)
        // Inicializando a ToolBarPicker
        self.detailView.creatToolBarPicker()
        // Carregando os dados da PickerCategory
        self.viewModel.loadDataPickerCategory()
    }
    
    init(viewModel:AddReleaseViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func settingPickerViewProtocols(delegate:UIPickerViewDelegate, dataSource:UIPickerViewDataSource) {
        self.detailView.pickerView.delegate = delegate
        self.detailView.pickerView.dataSource = dataSource
    }
}

extension AddReleasesViewController: DetailViewProtocol {
    
    func actionSegmentedControl(sender: UISegmentedControl) {
        viewModel.actionSegmentedControl(sender: sender)
    }
    
    func actionSelectButton(view: DetailView) {
        viewModel.actionSelectButton(view: view)
    }
    
    func actionCancelButtonToolbar(view: DetailView) {
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

extension AddReleasesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
        detailView.textFieldCategory.text = viewModel.titleForRow(row: row, component: component)
    }
}

// Criando uma Extension para implementação do protocolo UITextFieldDelegate
extension AddReleasesViewController: UITextFieldDelegate {
    
    // Informa ao delegate quando a seleção de texto é alterada
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.detailView.validTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    // Informa ao delegate quando a edição é interrompida
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
