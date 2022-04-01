//
//  MainListViewModel.swift
//  Financas
//
//  Created by Josué Herrera Rodrigues on 24/03/22.
//

import UIKit

protocol MainListViewModelProtocol {
    func actionSegmentedControl(sender: UISegmentedControl)
    func tappedAddReleaseButton()
    func numberOfRows(section: Int) -> Int
    func titleForHeader(section: Int) -> String
    func edintingStyleCellRight(editingStyle: UITableViewCell.EditingStyle, tableView: UITableView, indexPath: IndexPath)
    func editingStyleCellLeft(tableView: UITableView) -> UISwipeActionsConfiguration?
    func setUpHeaderView(section: Int, view: UIView)
    func getReleaseDetail(row: Int) -> ReleasesDetail
    func loadData()
}

class MainListViewModel {
    
   weak var addReleaseCoordinator: AddReleaseCoordinator?
   weak var editReleaseCoordinator: EditReleaseCoordinator?
   weak var mainListCoordinator: MainListCoordinator?
    
//    var updateView: (() -> Void)?
    
    private var releaseDetail:[ReleasesDetail] = []
    
//    {
//        didSet {
//           updateView?()
//        }
//    }
}

extension MainListViewModel: MainListViewModelProtocol {
    
    func actionSegmentedControl(sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            print("Essa semana")
            releaseDetail = releaseDetail.filter({ detail in
                detail.date == "29 Dez"
            })
        case 1:
            print("Essa mês")
            releaseDetail = releaseDetail.filter({ detail in
                detail.date == "19 Dez"
            })
        case 2:
            print("Todo conteudo")
            loadData()
        default:
            print("SegmentedControl")
        }
    }
    
    func tappedAddReleaseButton() {
        addReleaseCoordinator?.start()
    }
    
    func numberOfRows(section: Int) -> Int {
        return releaseDetail.count
    }
    
    func titleForHeader(section: Int) -> String {
        return "Lançamentos"
    }
    
    func edintingStyleCellRight(editingStyle: UITableViewCell.EditingStyle, tableView: UITableView, indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("Arraste Deletar")
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func editingStyleCellLeft(tableView: UITableView) -> UISwipeActionsConfiguration? {
        let adit = UIContextualAction (style: . normal , title: "Editar" ) { (action, view, complete ) in
            print("Arraste Editar")
            tableView.isEditing = false
            self.editReleaseCoordinator?.start()
        }
        // Editando a cor de fundo do arraste EDITAR
        adit.backgroundColor = CustomColor.appGreenCustom
        
        let config = UISwipeActionsConfiguration (actions:[adit])
        return config
    }
    
    func setUpHeaderView(section: Int, view: UIView) {
        
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
            header.textLabel?.textColor = UIColor.black
            header.textLabel?.frame = header.frame
            header.textLabel?.textAlignment = .left
        }
    }
    
    func getReleaseDetail(row: Int) -> ReleasesDetail {
       return releaseDetail[row]
    }
    
    func loadData() {
        
        self.releaseDetail = [
            ReleasesDetail(name: "VectorCima", type: "Salário", category: " Contas Fixas ", value: "R$ 3.000,00", date: "29 Dez"),
            ReleasesDetail(name: "VectorBaixo", type: "Luz", category: " Contas Fixas ", value: "R$ 100,00", date: "19 Dez"),
            ReleasesDetail(name: "VectorBaixo", type: "Aguá", category: " Contas Fixas ", value: "R$ 250,00", date: "12 Dez"),
            ReleasesDetail(name: "VectorBaixo", type: "Internet", category: " Contas Fixas ", value: "R$ 80,00", date: "10 Dez"),
            ReleasesDetail(name: "VectorBaixo", type: "Aluguel", category: " Contas Fixas ", value: "R$ 900,00", date: "09 Dez")
        ]
    }
}
