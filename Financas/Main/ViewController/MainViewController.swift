//
//  MainViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 21/03/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainViewScreen: MainViewScreen? = MainViewScreen()
    var segmentedControlView: SegmentedControlView? = SegmentedControlView()
    
    var releaseDetail:[ReleasesDetail] = [
        ReleasesDetail(imageName: "VectorCima", title: "Salário", categories: " Contas Fixas ", value: "R$ 3.000,00", date: "29 Dez"),
        ReleasesDetail(imageName: "VectorBaixo", title: "Luz", categories: " Contas Fixas ", value: "R$ 100,00", date: "19 Dez"),
        ReleasesDetail(imageName: "VectorBaixo", title: "Aguá", categories: " Contas Fixas ", value: "R$ 250,00", date: "12 Dez"),
        ReleasesDetail(imageName: "VectorBaixo", title: "Internet", categories: " Contas Fixas ", value: "R$ 80,00", date: "10 Dez"),
        ReleasesDetail(imageName: "VectorBaixo", title: "Aluguel", categories: " Contas Fixas ", value: "R$ 900,00", date: "09 Dez")
    ]

    override func loadView() {
        // Indicando que nossa View terá o mesmo formato, medidas e detalhes de nossa ContactViewScreen
        self.view = mainViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assinando os protocolos de delegate e datasource criados em nossa CONTACTVIEWSCREEN
        self.mainViewScreen?.settingTableViewProtocols(delegate: self, dataSource: self)
        self.segmentedControlView?.delegate(delegate: self)
        // Chamando as função de assinatura da NavigationController
        self.setNavigationBar()
    }
    
    // Função para setUp das caracterista da navigationController
    func setNavigationBar(){
        // Setando o title de minha NavigationBar
        self.title = "Meus gastos"
        // Deixando o titulo do Navigation em LargeTitle (Aumentando a fonte)
        navigationController?.navigationBar.prefersLargeTitles = true
        // Adicionando um BarButton com seleção de imagem personalizada
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Adicionar"), style: .plain, target: self, action: #selector(tappedAddReleaseButton))
    }
    
    // Função de seleção do Botão de adicionar
    @objc private func tappedAddReleaseButton() {
        print("Adicionar itens de Lançamento")
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
    
    // Criando e editando função de arraste da TableViewCell - Direita para esquerda - DELETE
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("Arraste Deletar")
        }
    }
    
//    // Criando e editando função de arraste da TableViewCell - Direita para esquerda - DELETE
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
//            print("Arraste Deletar")
//        }
//        return [delete]
//    }
    
    // Criando e editando função de arraste da TableViewCell - esquerda para direita - EDIT
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let add = UIContextualAction (style: . normal , title: "Editar" ) { (action, view, complete ) in
            print("Arraste Editar")
            self.isEditing = false
        }
        // Editando a cor de fundo do arraste EDITAR
        add.backgroundColor = UIColor(displayP3Red: 94/255, green: 163/255, blue: 163/255, alpha: 1.0)
        
        let config = UISwipeActionsConfiguration (actions:[add])
        return config
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

extension MainViewController: SegmentedControlProtocol {
    
   // func actionSegmentedControl(senderx: NSInteger){
    func actionSegmentedControl(sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            print("Essa semana")
        case 1:
            print("Essa mês")
        case 2:
            print("Todo conteudo")
        default:
            print("SegmentedControl")
        }
    }
}

