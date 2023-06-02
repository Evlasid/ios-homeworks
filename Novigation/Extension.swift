//
//  extension.swift
//  Novigation
//
//  Created by Евгений Сидоров on 27.05.2023.
//

import UIKit

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}
