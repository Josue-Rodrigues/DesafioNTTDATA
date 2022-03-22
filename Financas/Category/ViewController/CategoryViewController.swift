//
//  CategoryViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 22/03/22.
//

import UIKit

class CategoryViewController: UIViewController {

    var categoryViewScreen: CategoryViewScreen? = CategoryViewScreen()
    
    var categoryDetail:[CategoryDetail] = [
        CategoryDetail(title: "Automovel", description: "Funilaria e Pintura"),
        CategoryDetail(title: "Casa", description: "Fechamento da sacada"),
        CategoryDetail(title: "Mercado", description: "Compra do mês")
    ]

    override func loadView() {
        // Indicando que nossa View terá o mesmo formato, medidas e detalhes de nossa ContactViewScreen
        self.view = categoryViewScreen
        self.title = "Categorias"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assinando os protocolos de delegate e datasource criados em nossa CONTACTVIEWSCREEN
        self.categoryViewScreen?.settingTableViewProtocols(delegate: self, dataSource: self)
    }
}

// Colocando no HomeViewController em conformidade com os protocolos de Delegate e DataSource
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Função que determina a quantidade de celulas que terá a TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDetail.count
    }
    
    // Função de criação da Celula da TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CategoryTableViewCell? = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell
        cell?.setUpCell(data: self.categoryDetail[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // Função para determinar o tamanho da TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    // Função para exibição do Navigation Bar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
