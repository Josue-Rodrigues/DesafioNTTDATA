//
//  Alert.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 31/03/22.
//

import UIKit

class Alert: NSObject {
    
    var controller: UIViewController
    init (controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert (titulo: String, mensagem: String, button: String, completion:(() -> Void )? = nil) {
        
        let alertController = UIAlertController (title: titulo, message: mensagem, preferredStyle: .alert)
        let button = UIAlertAction(title: button, style: .cancel) { action in completion?()
        }
        
        alertController.addAction(button)
        
        self.controller.present(alertController, animated: true, completion: nil)
    }
}
