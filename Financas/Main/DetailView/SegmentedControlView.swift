//
//  SegmentedControlView.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 23/03/22.
//

import UIKit

protocol SegmentedControlProtocol: AnyObject { // O protocol tipo Class foi substituido pelo tipo AnyObject
    func actionSegmentedControl(sender: UISegmentedControl)
}

class SegmentedControlView: UIView {
    
    private weak var delegate: SegmentedControlProtocol?
    
    func delegate(delegate: SegmentedControlProtocol?){
        self.delegate = delegate
    }

    lazy var segmentedControl: UISegmentedControl = {
        
        let items = ["Essa semana", "Esse mês", "Todo periodo"]
        
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 6
        segmentedControl.layer.masksToBounds = true
        segmentedControl.tintColor = UIColor.black
        segmentedControl.addTarget(self, action: #selector(tappedSegmentedControlButton), for: .valueChanged)
        
        return segmentedControl
    }()
    
    // Metodo construtor do itens da View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        self.settingSegmentedControlConstraint()
    }
    
    // Função de erro (Criada automaticamente)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Função de seleção do Botão de cadastro
    @objc fileprivate func tappedSegmentedControlButton(_ sender: UISegmentedControl) {
        self.delegate?.actionSegmentedControl(sender: sender)
    }
    
    // Função para criação e edição do Backgound de nossa View
    private func settingsBackGround() {
        self.backgroundColor = .systemGray6
    }
    
    // Metodo de adição de nosso item em nossa SubView
    private func settingsSuperView() {
        self.addSubview(self.segmentedControl)
    }
    
    // FUNÇÕES DE CONSTRAINT DOS ITENS DA VIEW
    func settingSegmentedControlConstraint() {
        self.segmentedControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
