//
//  CustomString.swift
//  Financas
//
//  Created by Josué Herrera Rodriguês on 31/03/22.
//

import UIKit

extension String {
    func onlyNumbers() -> String {
        return self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    }
}
