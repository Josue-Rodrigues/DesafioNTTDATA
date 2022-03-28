//
//  CategoryViewModel.swift
//  Financas
//
//  Created by Josué Herrera Rodrigues on 24/03/22.
//

import UIKit

protocol CategoryViewModelProtocol {
    func tappedAddCategoryButton()
    func numberOfRows(section: Int) -> Int
    func loadData()
    func getCategoryDetail(row: Int) -> CategoryDetail
}

class CategoryViewModel {

    private var categoryDetail:[CategoryDetail] = []
    
}

extension CategoryViewModel: CategoryViewModelProtocol {
    func getCategoryDetail(row: Int) -> CategoryDetail {
        return categoryDetail[row]
    }
    
    func loadData() {
        
        self.categoryDetail = [
            CategoryDetail(title: "Automovel", description: "Funilaria e Pintura"),
            CategoryDetail(title: "Casa", description: "Fechamento da sacada"),
            CategoryDetail(title: "Mercado", description: "Compra do mês"),
            CategoryDetail(title: "Contas Fixas", description: "Salario de Janeiro"),
            CategoryDetail(title: "Contas Fixas", description: "Conta de água - Mês de Janeiro"),
            CategoryDetail(title: "Contas Fixas", description: "Conta de luz - Mês de Janeiro"),
            CategoryDetail(title: "Contas Fixas", description: "Conta de intenet - Mês de Janeiro")
        ]
    }
    
    func numberOfRows(section: Int) -> Int {
        return categoryDetail.count
    }
    
    func tappedAddCategoryButton() {
        print("BOTÃO ADICIONAR CATEGORIA CLICADO")
    }
}
