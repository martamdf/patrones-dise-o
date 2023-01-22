//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Marta Maquedano on 20/1/23.
//

import Foundation
import UIKit

class LoginViewModel: NSObject {
    
    var updateStatus: ((_ token: String) -> Void)?
    
    override init() {
    }
    
    func getToken(email: String, password: String, completion: @escaping (String) -> Void) {
        
        let email: String? = email
        let password: String? = password
        let myToken = ""
        
        let apiClient = ApiClient(token: myToken)
        apiClient.login(user: email!, password: password!) { loginToken, error in
            completion(loginToken ?? "Error en Usuario o Contraseña. Introduzca de nuevo los datos.")
        }
    }
}
