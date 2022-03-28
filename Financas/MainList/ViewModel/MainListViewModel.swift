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
    func setUpHeaderView(section: Int, view: UIView)
    func getReleaseDetail(row: Int) -> ReleasesDetail
    func loadData()
}

class MainListViewModel {
    
   weak var addReleaseCoordinator: AddReleaseCoordinator?
    
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
            ReleasesDetail(imageName: "VectorCima", title: "Salário", categories: " Contas Fixas ", value: "R$ 3.000,00", date: "29 Dez"),
            ReleasesDetail(imageName: "VectorBaixo", title: "Luz", categories: " Contas Fixas ", value: "R$ 100,00", date: "19 Dez"),
            ReleasesDetail(imageName: "VectorBaixo", title: "Aguá", categories: " Contas Fixas ", value: "R$ 250,00", date: "12 Dez"),
            ReleasesDetail(imageName: "VectorBaixo", title: "Internet", categories: " Contas Fixas ", value: "R$ 80,00", date: "10 Dez"),
            ReleasesDetail(imageName: "VectorBaixo", title: "Aluguel", categories: " Contas Fixas ", value: "R$ 900,00", date: "09 Dez")
        ]
    }
}
