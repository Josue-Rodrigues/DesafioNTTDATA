//
//  CategoryViewScreen.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 22/03/22.
//

import UIKit

class CategoryViewScreen: UIView {

    lazy var categoryTableViewCell: UITableView = {
        let categoryTableViewCell = UITableView()
        categoryTableViewCell.backgroundColor = .white
        // Adicionando/Registrando nossas celulas dentro de nossa TableView
        categoryTableViewCell.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
        return categoryTableViewCell
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingCategoryTableViewCellConstraint()
    }
    
    private func settingsBackGround() {
        self.backgroundColor = .white
    }
    
    // Função para configuração do delegate e dataSource em nossa tableView
    public func settingTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource) {
        self.categoryTableViewCell.delegate = delegate
        self.categoryTableViewCell.dataSource = dataSource
    }
    
    func settingsSuperView() {
        self.addSubview(self.categoryTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Metodo de criação e configuração das Constraints (Framework - SNAPKIT)
    func settingCategoryTableViewCellConstraint() {
        self.categoryTableViewCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
