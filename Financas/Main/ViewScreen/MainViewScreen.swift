//
//  MainViewScreen.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 21/03/22.
//

import UIKit

class MainViewScreen: UIView {

    lazy var entryDetailView: EntryDetailView = {
        
        let entryDetailView = EntryDetailView()
        entryDetailView.clipsToBounds = true
        entryDetailView.layer.cornerRadius = 8
        
        return entryDetailView
    }()
    
    lazy var outputDetailView: OutputDetailView = {
        
        let outputDetailView = OutputDetailView()
        outputDetailView.clipsToBounds = true
        outputDetailView.layer.cornerRadius = 8
        
        return outputDetailView
    }()
    
    lazy var releasesTableViewCell: UITableView = {
        let releasesTableViewCell = UITableView()
        releasesTableViewCell.backgroundColor = .white
        // Adicionando/Registrando nossas celulas dentro de nossa TableView
        releasesTableViewCell.register(ReleasesTableViewCell.self, forCellReuseIdentifier: ReleasesTableViewCell.identifier)
        
        return releasesTableViewCell
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingEntryDetailViewConstraint()
        self.settingOutputDetailViewConstraint()
        self.settingReleasesTableViewCellConstraint()
    }
    
    private func settingsBackGround() {
        self.backgroundColor = .white
    }
    
    // Função para configuração do delegate e dataSource em nossa tableView
    public func settingTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource) {
        self.releasesTableViewCell.delegate = delegate
        self.releasesTableViewCell.dataSource = dataSource
    }
    
    func settingsSuperView() {
        self.addSubview(self.entryDetailView)
        self.addSubview(self.outputDetailView)
        self.addSubview(self.releasesTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Metodo de criação e configuração das Constraints (Framework - SNAPKIT)
    func settingEntryDetailViewConstraint() {
        self.entryDetailView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(205)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.centerX).offset(-8)
            make.height.equalTo(124)
        }
    }
    
    func settingOutputDetailViewConstraint() {
        self.outputDetailView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(205)
            make.right.equalToSuperview().inset(16)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.centerX).offset(8)
            make.height.equalTo(124)
        }
    }
    
    func settingReleasesTableViewCellConstraint() {
        self.releasesTableViewCell.snp.makeConstraints { make in
            make.top.equalTo(self.entryDetailView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
