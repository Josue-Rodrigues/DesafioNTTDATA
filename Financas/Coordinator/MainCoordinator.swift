//
//  MainCoordinator.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 24/03/22.
//

import UIKit

protocol Coordinator {
    
    var rootViewController: UIViewController {get}
    func start()
}
