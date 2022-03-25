//
//  AddReleasesViewController.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 25/03/22.
//

import UIKit

class AddReleasesViewController: UIViewController {
    
    var detailView: DetailView?
    var viewModel: AddReleaseViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = DetailView()
        self.setNavigationBar()
    }
    
    // Função para setUp das caracterista da navigationController
    func setNavigationBar(){
        // Setando o title de minha NavigationBar
        navigationItem.title = "Adicionar lançamentos"
        // Deixando o titulo do Navigation em LargeTitle (Aumentando a fonte)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    init(viewModel:AddReleaseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
