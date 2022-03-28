//
//  ReleasesTableViewCell.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 21/03/22.
//

import UIKit

class ReleasesTableViewCell: UITableViewCell {
    
    // Criando o identifier de noss TableView
    static let identifier:String = "ReleasesTableViewCell"
    
    lazy var imageName:UIImageView = {
        
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor.black
        
        return image
    }()
    
    lazy var labelTitle:UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    lazy var labelCategories:UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.backgroundColor = .systemGray
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.textColor = .white
        
        return label
    }()
    
    lazy var labelValue:UILabel = {
        
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = UIColor(displayP3Red: 159/255, green: 200/255, blue: 229/255, alpha: 1.0)
        
        return label
    }()
    
    lazy var labelDate:UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingImageViewConstraint()
        self.settingLabelTitleConstraint()
        self.settingLabelCategoriesConstraint()
        self.settingLabelValueConstraint()
        self.settingLabelDateConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingsSuperView() {
        self.addSubview(self.imageName)
        self.addSubview(self.labelTitle)
        self.addSubview(self.labelCategories)
        self.addSubview(self.labelValue)
        self.addSubview(self.labelDate)
    }
    
    private func settingsBackGround() {
        self.backgroundColor = .white
    }
    
    // Função de chamada de nossa Model e atribuição de valores
    public func setUpCell(data:ReleasesDetail) {
        self.imageName.image = UIImage(named:data.imageName)
        self.labelTitle.text = data.title
        self.labelCategories.text = data.categories
        self.labelValue.text = data.value
        self.labelDate.text = data.date
    }
    
    func settingImageViewConstraint() {
        self.imageName.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            // Definindo medidas de Height e Width em uma unica linha, pois ambos possuem a mesma medida
            make.height.width.equalTo(24)
        }
    }
    
    func settingLabelTitleConstraint() {
        self.labelTitle.snp.makeConstraints { make in
            make.bottom.equalTo(self.imageName.snp.centerY).inset(2)
            make.leading.equalTo(self.imageName.snp.trailing).offset(16)
        }
    }
    
    func settingLabelCategoriesConstraint() {
        self.labelCategories.snp.makeConstraints { make in
            make.top.equalTo(self.imageName.snp.centerY).offset(2)
            make.leading.equalTo(self.imageName.snp.trailing).offset(16)
        }
    }
    
    func settingLabelValueConstraint() {
        self.labelValue.snp.makeConstraints { make in
            make.centerY.equalTo(self.labelTitle.snp.centerY).offset(2)
            make.right.equalToSuperview().inset(16)
        }
    }
    
    func settingLabelDateConstraint() {
        self.labelDate.snp.makeConstraints { make in
            make.centerY.equalTo(self.labelCategories.snp.centerY).offset(2)
            make.right.equalToSuperview().inset(16)
        }
    }
}
