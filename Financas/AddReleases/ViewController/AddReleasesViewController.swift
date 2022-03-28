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
    }
    
    init(viewModel:AddReleaseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
