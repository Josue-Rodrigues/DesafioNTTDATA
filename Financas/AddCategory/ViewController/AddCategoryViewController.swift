//
//  AddCategoryViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 29/03/22.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    var viewModel: AddCategoryViewModelProtocol
    var addCategoryDetailView: AddCategoryDetailView = AddCategoryDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = addCategoryDetailView
    }
    
    init(viewModel:AddCategoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
