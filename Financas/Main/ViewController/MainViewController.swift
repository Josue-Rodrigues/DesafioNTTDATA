//
//  MainViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 21/03/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainViewScreen: MainViewScreen? = MainViewScreen()
    
    var releaseDetail:[ReleasesDetail] = [
        ReleasesDetail(imageName: "VectorCima", title: "Salário", categories: " Contas Fixas ", value: "R$ 3.000,00", date: "29 Dez"),
        ReleasesDetail(imageName: "VectorBaixo", title: "Luz", categories: " Contas Fixas ", value: "R$ 100,00", date: "29 Dez"),
        ReleasesDetail(imageName: "VectorBaixo", title: "Aguá", categories: " Contas Fixas ", value: "R$ 250,00", date: "29 Dez"),
        ReleasesDetail(imageName: "VectorBaixo", title: "Internet", categories: " Contas Fixas ", value: "R$ 80,00", date: "29 Dez")
    ]

    override func loadView() {
        // Indicando que nossa View terá o mesmo formato, medidas e detalhes de nossa ContactViewScreen
        self.view = mainViewScreen
        self.title = "Meus Gastos"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assinando os protocolos de delegate e datasource criados em nossa CONTACTVIEWSCREEN
        self.mainViewScreen?.settingTableViewProtocols(delegate: self, dataSource: self)
    }
}

// Colocando no HomeViewController em conformidade com os protocolos de Delegate e DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Função que determina a quantidade de celulas que terá a TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return releaseDetail.count
    }
    
    // Função para criação do Title da TableView
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Lançamentos"
    }

    // Função para ajuste e edição da fonte do Title da TableView
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
            header.textLabel?.textColor = UIColor.black
            header.textLabel?.frame = header.frame
            header.textLabel?.textAlignment = .left
        }
    }

    // Função para ajuste da altura do titulo da TableView
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 41
    }
    
    // Função de criação da Celula da TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ReleasesTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ReleasesTableViewCell.identifier, for: indexPath) as? ReleasesTableViewCell
        cell?.setUpCell(data: self.releaseDetail[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    // Função para determinar o tamanho da TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    // Função para exibição do Navigation Bar
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
