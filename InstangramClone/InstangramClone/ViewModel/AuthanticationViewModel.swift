//
//  AuthanticationViewModel.swift
//  InstangramClone
//
//  Created by Kadir Yasin Özmen on 22.06.2023.
//

import UIKit.UIColor

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    var buttonBackGroundColor: UIColor {
        return formIsValid ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : .white.withAlphaComponent(0.5)
    }
    
}

//if viewModel.formIsValid {
//    loginButton.isEnabled = true
//    loginButton.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
//} else {
//    loginButton.isEnabled = false
//    loginButton.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
//}
