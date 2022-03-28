//
//  CategoryViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 24/03/22.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var viewModel: CategoryViewModel
    
    lazy var categoryTableViewCell: UITableView = {
        let categoryTableViewCell = UITableView()
        categoryTableViewCell.backgroundColor = .white
        // Adicionando/Registrando nossas celulas dentro de nossa TableView
        categoryTableViewCell.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
        return categoryTableViewCell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingTableViewProtocols(delegate: self, dataSource: self)
        self.setNavigationBar()
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingCategoryTableViewCellConstraint()
        
        self.viewModel.loadData()
    }
    
    // Função para setUp das caracterista da navigationController
    func setNavigationBar(){
        // Setando o title de minha NavigationBar
        navigationItem.title = "Categorias"
        // Deixando o titulo do Navigation em LargeTitle (Aumentando a fonte)
        navigationController?.navigationBar.prefersLargeTitles = true
        // Adicionando um BarButton com seleção de imagem personalizada
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Adicionar"), style: .plain, target: self, action: #selector(tappedAddCategoryButton))
    }
    
    // Função de seleção do Botão de adicionar
    @objc private func tappedAddCategoryButton() {
        viewModel.tappedAddCategoryButton()
    }
    
    init(viewModel:CategoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    private func settingsBackGround() {
        self.view.backgroundColor = .white
    }
    
    // Função para configuração do delegate e dataSource em nossa tableView
    public func settingTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource) {
        self.categoryTableViewCell.delegate = delegate
        self.categoryTableViewCell.dataSource = dataSource
    }
    
    func settingsSuperView() {
        self.view.addSubview(self.categoryTableViewCell)
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

// Colocando no HomeViewController em conformidade com os protocolos de Delegate e DataSource
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Função que determina a quantidade de celulas que terá a TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }
    
    // Função de criação da Celula da TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CategoryTableViewCell? = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell
        cell?.setUpCell(data: self.viewModel.getCategoryDetail(row: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    // Função para determinar o tamanho da TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}

