//
//  ImageViewValue.swift
//  Financas
//
//  Created by Valeria Moreira pereira rodrigues on 29/03/22.
//

import UIKit

class ImageViewValue: UIView {

    lazy var imageViewValue:UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "VectorCima")
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
              
        return image
    }()
    
    // Metodo construtor do itens da View
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.settingImageViewValue()
    }
    
    // Função de erro (Criada automaticamente)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingImageViewValue(){
        
        backgroundColor = CustomColor.appBlueCustom
        addSubview(self.imageViewValue)
        NSLayoutConstraint.activate([
        
            imageViewValue.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageViewValue.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewValue.heightAnchor.constraint(equalToConstant: 24),
            imageViewValue.widthAnchor.constraint(equalToConstant: 24),
            heightAnchor.constraint(equalToConstant: 40),
            widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
