//
//  CategoryDetailView.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 29/03/22.
//

import UIKit

protocol CategoryDetailViewProtocol: AnyObject { // O protocol tipo Class foi substituido pelo tipo AnyObject
    func actionSaveButton()
    func actionCancelButton()
}

class AddCategoryDetailView: UIView {
        
        private var delegate: CategoryDetailViewProtocol?
        
        func delegate(delegate: CategoryDetailViewProtocol?){
            self.delegate = delegate
        }
        
        lazy var labelTitle: UILabel = {
            
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 28)
            label.text = "Adicionar Categoria"
            
            return label
        }()
        
        lazy var labelNameCategory: UILabel = {
            
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.text = "Nome da categoria"
            
            return label
        }()
        
        lazy var textFieldNameCategory: UITextField = {
            
            let textField = UITextField()
            textField.autocorrectionType = .no
            textField.backgroundColor = .white
            textField.borderStyle = .roundedRect
            textField.keyboardType = .default
            textField.placeholder = "Exemplo: Casa"
            textField.textColor = .darkGray
            textField.clipsToBounds = true
            textField.layer.cornerRadius = 4
            
            return textField
        }()
        
        lazy var labelDescriptionCategory: UILabel = {
            
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.text = "Descrição da categoria"
            
            return label
        }()
        
        lazy var textFieldDescriptionCategory: UITextField = {
            
            let textField = UITextField()
            textField.autocorrectionType = .no
            textField.backgroundColor = .white
            textField.borderStyle = .roundedRect
            textField.keyboardType = .numberPad
            textField.placeholder = "Exemplo: Gastos relacionados a moradia"
            textField.textColor = .darkGray
            textField.clipsToBounds = true
            textField.layer.cornerRadius = 4
            
            return textField
        }()
        
        lazy var buttonSave: UIButton = {
            
            let button = UIButton()
            button.setTitle("Salvar", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.white, for: .normal)
            button.clipsToBounds = true
            button.layer.cornerRadius = 8
            button.backgroundColor = UIColor(displayP3Red: 94/255, green: 163/255, blue: 163/255, alpha: 1.0)
            button.addTarget(self, action: #selector(self.tappedSaveButton), for: .touchUpInside)
            
            return button
        }()
        
        lazy var buttonCancel: UIButton = {
            
            let button = UIButton()
            button.setTitle("Cancelar", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(UIColor(displayP3Red: 94/255, green: 163/255, blue: 163/255, alpha: 1.0), for: .normal)
            button.addTarget(self, action: #selector(self.tappedCancelButton), for: .touchUpInside)
            
            return button
        }()
        
        // Metodo construtor do itens da View
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.settingsSuperView()
            self.settingsBackGround()
            //----------------------------------------
            self.settingLabelTitleConstraint()
            self.settingLabelNameCategoryConstraint()
            self.settingTextFieldNameCategoryConstraint()
            self.settingLabelDescriptionCategoryConstraint()
            self.settingTextFieldDescriptionCategoryConstraint()
            self.settingButtonSaveConstraint()
            self.settingButtonCancelConstraint()
        }
        
        // Função de erro (Criada automaticamente)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // Função para configuração do delegate de nossas textfield (Necessario para fazer as validações das textFields)
        public func settingTextFieldDelegate (delegate:UITextFieldDelegate) {
            
            self.textFieldNameCategory.delegate = delegate
            self.textFieldDescriptionCategory.delegate = delegate
        }
        
        // Função para configuração da aparencia do Botton de acordo com seu Status
        private func settingButtonEnable(_ enable: Bool) {
            
            if enable {
                self.buttonSave.setTitleColor(.white, for: .normal)
                self.buttonSave.backgroundColor = UIColor(displayP3Red: 94/255, green: 163/255, blue: 163/255, alpha: 1.0)
                self.buttonSave.isEnabled = true
                
            }else{
                self.buttonSave.setTitleColor(.black, for: .normal)
                self.buttonSave.backgroundColor = .systemGray5
                self.buttonSave.isEnabled = false
            }
        }
        
        // Função para validação dos campos
        func validTextField() {
            
            let nameCategory: String = self.textFieldNameCategory.text ?? ""
            let descriptionCategory: String = self.textFieldDescriptionCategory.text ?? ""
            
            if nameCategory.isEmpty || descriptionCategory.isEmpty {
                
                self.settingButtonEnable(false)
                
            }else{
                self.settingButtonEnable(true)
            }
        }
        
        @objc private func tappedSaveButton() {
            self.delegate?.actionSaveButton()
        }
        
        @objc private func tappedCancelButton() {
            self.delegate?.actionCancelButton()
        }
        
        // Função para criação e edição do Backgound de nossa View
        private func settingsBackGround() {
            self.backgroundColor = .white
        }
        
        // Metodo de adição de nosso item em nossa SubView
        private func settingsSuperView() {
            self.addSubview(self.labelTitle)
            self.addSubview(self.labelNameCategory)
            self.addSubview(self.textFieldNameCategory)
            self.addSubview(self.labelDescriptionCategory)
            self.addSubview(self.textFieldDescriptionCategory)
            self.addSubview(self.buttonSave)
            self.addSubview(self.buttonCancel)
            
        }
        
        // FUNÇÕES DE CONSTRAINT DOS ITENS DA VIEW
        func settingLabelTitleConstraint() {
            self.labelTitle.snp.makeConstraints { make in
                make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(25)
                make.centerX.equalToSuperview()
            }
        }
        
        func settingLabelNameCategoryConstraint() {
            self.labelNameCategory.snp.makeConstraints { make in
                make.top.equalTo(self.labelTitle.snp.bottom).offset(31)
                make.left.equalToSuperview().offset(17)
            }
        }
        
        func settingTextFieldNameCategoryConstraint() {
            self.textFieldNameCategory.snp.makeConstraints { make in
                make.top.equalTo(self.labelNameCategory.snp.bottom).offset(4)
                make.left.equalTo(self.labelNameCategory.snp.left)
                make.right.equalToSuperview().offset(-17)
                make.height.equalTo(40)
            }
        }
        
        func settingLabelDescriptionCategoryConstraint() {
            self.labelDescriptionCategory.snp.makeConstraints { make in
                make.top.equalTo(self.textFieldNameCategory.snp.bottom).offset(24)
                make.left.equalTo(self.labelNameCategory.snp.left)
            }
        }
        
        func settingTextFieldDescriptionCategoryConstraint() {
            self.textFieldDescriptionCategory.snp.makeConstraints { make in
                make.top.equalTo(self.labelDescriptionCategory.snp.bottom).offset(4)
                make.left.equalTo(self.textFieldNameCategory.snp.left)
                make.right.equalTo(self.textFieldNameCategory.snp.right)
                make.height.equalTo(40)
            }
        }
        
        func settingButtonSaveConstraint() {
            self.buttonSave.snp.makeConstraints { make in
                make.top.equalTo(self.textFieldDescriptionCategory.snp.bottom).offset(24)
                make.left.equalTo(self.textFieldNameCategory.snp.left)
                make.right.equalTo(self.textFieldNameCategory.snp.right)
                make.height.equalTo(52)
            }
        }
        
        func settingButtonCancelConstraint() {
            self.buttonCancel.snp.makeConstraints { make in
                make.top.equalTo(self.buttonSave.snp.bottom).offset(8)
                make.left.equalTo(self.textFieldNameCategory.snp.left)
                make.right.equalTo(self.textFieldNameCategory.snp.right)
                make.height.equalTo(52)
            }
        }
    }
