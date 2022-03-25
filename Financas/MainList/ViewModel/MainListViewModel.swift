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
}

class MainListViewModel {

}

extension MainListViewModel: MainListViewModelProtocol {
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
    
    func tappedAddReleaseButton() {
        print("BOTÃO ADICIONAR LANÇAMENTOS CLICADO")
    }
}
