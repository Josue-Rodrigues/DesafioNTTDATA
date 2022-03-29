//
//  DetailView.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 25/03/22.
//

import UIKit

protocol DetailViewProtocol: AnyObject { // O protocol tipo Class foi substituido pelo tipo AnyObject
    func actionSegmentedControl(sender: UISegmentedControl)
    func actionSelectButton(view: DetailView)
    func actionCancelButtonToolbar(view: DetailView)
    func actionSaveButton()
    func actionCancelButton()
}

class DetailView: UIView {
    
    var pickerView = UIPickerView()
    
    private var delegate: DetailViewProtocol?
    
    func delegate(delegate: DetailViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var labelTitle: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "Adicionar lançamentos"

        return label
    }()
    
    lazy var labelSpend: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Gastos"

        return label
    }()
    
    lazy var textFieldSpend: UITextField = {
        
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Exemplo: Internet"
        textField.textColor = .darkGray
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 4
        
        return textField
    }()
    
    lazy var labelReleasesType: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Tipos de lançamento"

        return label
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        
        let items = ["Entrada", "Saida"]
        
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 6
        segmentedControl.layer.masksToBounds = true
        segmentedControl.tintColor = UIColor.black
        segmentedControl.backgroundColor = UIColor(displayP3Red: 159/255, green: 200/255, blue: 229/255, alpha: 0.7)
        segmentedControl.clipsToBounds = true
        segmentedControl.layer.cornerRadius = 8
        segmentedControl.addTarget(self, action: #selector(tappedSegmentedControlButton), for: .valueChanged)
        
        return segmentedControl
    }()
    
    lazy var labelValue: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Valor"

        return label
    }()
    
    lazy var imageViewValue:UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "VectorCima")
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
              
        return image
    }()
    
    lazy var textFieldValue: UITextField = {
        
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.placeholder = "R$ 0.00"
        textField.textColor = .darkGray
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 4
        
        return textField
    }()
    
    lazy var labelCategory: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Categoria"

        return label
    }()
    
    lazy var textFieldCategory: UITextField = {
        
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Selecione categoria"
        textField.textColor = .darkGray
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 4
        // Incluindo um PickerView dentro da TextField
        textField.inputView = pickerView

        return textField
    }()
    
    lazy var imageViewPickerCategory:UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "Picker")
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
              
        return image
    }()
    
    lazy var labelDate: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Data"

        return label
    }()
    
    lazy var textFieldDate: UITextField = {
        
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Selecione uma data"
        textField.textColor = .darkGray
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 4
        textField.inputView = datePicker
        
        return textField
    }()
    
    lazy var imageViewPickerDate:UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "Picker")
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
              
        return image
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
    
    lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = NSLocale.init(localeIdentifier: "pt-br") as Locale
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(self.displayDate(sender:)), for: .valueChanged)
        
        return datePicker
    }()
    
    @objc func displayDate(sender: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        self.textFieldDate.text = format.string(from: sender.date)
    }
    
    func creatToolBarPicker(){
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 0))
        let cancelButton = UIBarButtonItem(title: "Fechar", style: .plain, target: self, action: #selector(tappedCancelButtonToolbar))
        // Criando um espaço entre os Botões (.flexibleSpace)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        // -----------------------------------------------------------------------------------------------
        let selectButton = UIBarButtonItem(title: "Selecionar", style: .plain, target: self, action: #selector(tappedSelectButton))
        let items = [cancelButton, flexibleSpace, selectButton]

        toolbar.setItems(items, animated: false)
        toolbar.sizeToFit()

        // Inserindo a ToolBar dentro do Picker e TextField
        textFieldCategory.inputAccessoryView = toolbar
        textFieldDate.inputAccessoryView = toolbar
    }
    
    // Metodo construtor do itens da View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        //----------------------------------------
        self.settingLabelTitleConstraint()
        self.settingLabelSpendConstraint()
        self.settingTextFieldSpendConstraint()
        self.settingLabelReleasesTypeConstraint()
        self.settingSegmentedControlConstraint()
        self.settingLabelValueConstraint()
        self.settingImageViewValueConstraint()
        self.settingTextFieldValueConstraint()
        self.settingLabelCategoryConstraint()
        self.settingTextFieldCategoryConstraint()
        self.settingImageViewPickerCategoryConstraint()
        self.settingLabelDateConstraint()
        self.settingTextFieldDateConstraint()
        self.settingImageViewPickerDateConstraint()
        self.settingButtonSaveConstraint()
        self.settingButtonCancelConstraint()
    }
    
    // Função de erro (Criada automaticamente)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Função para configuração do delegate de nossas textfield (Necessario para fazer as validações das textFields)
    public func settingTextFieldDelegate (delegate:UITextFieldDelegate){
        
        self.textFieldSpend.delegate = delegate
        self.textFieldValue.delegate = delegate
        self.textFieldCategory.delegate = delegate
        self.textFieldDate.delegate = delegate
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
        
        let spend: String = self.textFieldSpend.text ?? ""
        let value: String = self.textFieldValue.text ?? ""
        let category: String = self.textFieldCategory.text ?? ""
        let date: String = self.textFieldDate.text ?? ""
        
        if spend.isEmpty || value.isEmpty || category.isEmpty || date.isEmpty {
            
            self.settingButtonEnable(false)
            
        }else{
            self.settingButtonEnable(true)
        }
    }
    
    @objc fileprivate func tappedSegmentedControlButton(_ sender: UISegmentedControl) {
        self.delegate?.actionSegmentedControl(sender: sender)
    }
    
    @objc func tappedSelectButton(){
        self.delegate?.actionSelectButton(view: self)
    }
    
    @objc func tappedCancelButtonToolbar(){
        self.delegate?.actionCancelButtonToolbar(view: self)
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
        self.addSubview(self.labelSpend)
        self.addSubview(self.textFieldSpend)
        self.addSubview(self.labelReleasesType)
        self.addSubview(self.segmentedControl)
        self.addSubview(self.labelValue)
        self.addSubview(self.imageViewValue)
        self.addSubview(self.textFieldValue)
        self.addSubview(self.labelCategory)
        self.addSubview(self.textFieldCategory)
        self.addSubview(self.imageViewPickerCategory)
        self.addSubview(self.labelDate)
        self.addSubview(self.textFieldDate)
        self.addSubview(self.imageViewPickerDate)
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
    
    func settingLabelSpendConstraint() {
        self.labelSpend.snp.makeConstraints { make in
            make.top.equalTo(self.labelTitle.snp.bottom).offset(31)
            make.left.equalToSuperview().offset(17)
        }
    }
    
    func settingTextFieldSpendConstraint() {
        self.textFieldSpend.snp.makeConstraints { make in
            make.top.equalTo(self.labelSpend.snp.bottom).offset(4)
            make.left.equalTo(self.labelSpend.snp.left)
            make.right.equalToSuperview().offset(-17)
            make.height.equalTo(40)
        }
    }
    
    func settingLabelReleasesTypeConstraint() {
        self.labelReleasesType.snp.makeConstraints { make in
            make.top.equalTo(self.textFieldSpend.snp.bottom).offset(24)
            make.left.equalTo(self.labelSpend.snp.left)
        }
    }
    
    func settingSegmentedControlConstraint() {
        self.segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(self.labelReleasesType.snp.bottom).offset(4)
            make.left.equalTo(self.labelSpend.snp.left)
            make.right.equalTo(self.textFieldSpend.snp.right)
            make.height.equalTo(32)
        }
    }
    
    func settingLabelValueConstraint() {
        self.labelValue.snp.makeConstraints { make in
            make.top.equalTo(self.segmentedControl.snp.bottom).offset(24)
            make.left.equalTo(self.labelSpend.snp.left)
        }
    }
    
    func settingImageViewValueConstraint() {
        self.imageViewValue.snp.makeConstraints { make in
            make.centerY.equalTo(self.textFieldValue.snp.centerY)
            make.left.equalToSuperview().offset(23)
            make.height.width.equalTo(25)
        }
    }
    
    func settingTextFieldValueConstraint() {
        self.textFieldValue.snp.makeConstraints { make in
            make.top.equalTo(self.labelValue.snp.bottom).offset(4)
            make.left.equalTo(self.imageViewValue.snp.right).offset(15)
            make.right.equalTo(self.textFieldSpend.snp.right)
            make.height.equalTo(40)
        }
    }
    
    func settingLabelCategoryConstraint() {
        self.labelCategory.snp.makeConstraints { make in
            make.top.equalTo(self.textFieldValue.snp.bottom).offset(24)
            make.left.equalTo(self.labelSpend.snp.left)
        }
    }
    
    func settingTextFieldCategoryConstraint() {
        self.textFieldCategory.snp.makeConstraints { make in
            make.top.equalTo(self.labelCategory.snp.bottom).offset(4)
            make.left.equalTo(self.textFieldSpend.snp.left)
            make.right.equalTo(self.textFieldSpend.snp.right)
            make.height.equalTo(40)
        }
    }
    
    func settingImageViewPickerCategoryConstraint() {
        self.imageViewPickerCategory.snp.makeConstraints { make in
            make.centerY.equalTo(self.textFieldCategory.snp.centerY)
            make.right.equalTo(self.textFieldSpend.snp.right).offset(-15)
        }
    }
    
    func settingLabelDateConstraint() {
        self.labelDate.snp.makeConstraints { make in
            make.top.equalTo(self.textFieldCategory.snp.bottom).offset(24)
            make.left.equalTo(self.labelSpend.snp.left)
        }
    }
    
    func settingTextFieldDateConstraint() {
        self.textFieldDate.snp.makeConstraints { make in
            make.top.equalTo(self.labelDate.snp.bottom).offset(4)
            make.left.equalTo(self.textFieldSpend.snp.left)
            make.right.equalTo(self.textFieldSpend.snp.right)
            make.height.equalTo(40)
        }
    }
    
    func settingImageViewPickerDateConstraint() {
        self.imageViewPickerDate.snp.makeConstraints { make in
            make.centerY.equalTo(self.textFieldDate.snp.centerY)
            make.right.equalTo(self.textFieldSpend.snp.right).offset(-15)
        }
    }
    
    func settingButtonSaveConstraint() {
        self.buttonSave.snp.makeConstraints { make in
            make.top.equalTo(self.textFieldDate.snp.bottom).offset(24)
            make.left.equalTo(self.textFieldSpend.snp.left)
            make.right.equalTo(self.textFieldSpend.snp.right)
            make.height.equalTo(52)
        }
    }
    
    func settingButtonCancelConstraint() {
        self.buttonCancel.snp.makeConstraints { make in
            make.top.equalTo(self.buttonSave.snp.bottom).offset(8)
            make.left.equalTo(self.textFieldSpend.snp.left)
            make.right.equalTo(self.textFieldSpend.snp.right)
            make.height.equalTo(52)
        }
    }
}
