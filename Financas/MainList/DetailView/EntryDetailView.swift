//
//  EntryDetailView.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 21/03/22.
//

import UIKit

class EntryDetailView: UIView {
    
    lazy var imageName:UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "VectorCima")
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor.black
        
        return image
    }()
    
    lazy var labelValue: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.text = "R$3.000,00"

        return label
    }()
    
    lazy var labelSubTitle: UILabel = {

        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = Constant.MeusGastos.labelSubTitle.rawValue

        return label
    }()
    
    // Metodo construtor do itens da View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingsSuperView()
        self.settingsBackGround()
        //----------------------------------------------
        self.settingImageNameConstraint()
        self.settingLabelValueConstraint()
        self.settingLabelSubTitleConstraint()
    }
    
    // Função de erro (Criada automaticamente)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Função para criação e edição do Backgound de nossa View
    private func settingsBackGround() {
        self.backgroundColor = CustomColor.appBlueCustom
    }
    
    // Metodo de adição de nosso item em nossa SubView
    private func settingsSuperView() {
        self.addSubview(self.imageName)
        self.addSubview(self.labelValue)
        self.addSubview(self.labelSubTitle)
    }
    
    // FUNÇÕES DE CONSTRAINT DOS ITENS DA VIEW
    func settingImageNameConstraint() {
        self.imageName.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(12)
            make.height.width.equalTo(24)
        }
    }

    func settingLabelValueConstraint() {
        self.labelValue.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(56)
            make.leading.equalToSuperview().inset(12)
        }
    }
    
    func settingLabelSubTitleConstraint() {
        self.labelSubTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(85)
            make.leading.equalToSuperview().inset(12)
        }
    }
}
