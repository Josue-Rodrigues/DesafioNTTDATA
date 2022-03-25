//
//  TableViewCell.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 22/03/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    // Criando o identifier de noss TableView
    static let identifier:String = "CategoryTableViewCell"
    
    lazy var labelTitle:UILabel = {
        
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    lazy var labelDescription:UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingLabelTitleConstraint()
        self.settingLabelDescriptionConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingsSuperView() {
        self.addSubview(self.labelTitle)
        self.addSubview(self.labelDescription)
    }
    
    private func settingsBackGround() {
        self.backgroundColor = .white
    }
    
    // Função de chamada de nossa Model e atribuição de valores
    public func setUpCell(data:CategoryDetail) {
        self.labelTitle.text = data.title
        self.labelDescription.text = data.description
    }
    
    func settingLabelTitleConstraint() {
        self.labelTitle.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(15)
        }
    }
    
    func settingLabelDescriptionConstraint() {
        self.labelDescription.snp.makeConstraints { make in
            make.bottom.left.equalToSuperview().inset(15)
        }
    }
}
