//
//  LoginView.swift
//  DragonBallBase
//
//  Created by Marta Maquedano on 20/1/23.
//

import Foundation
import UIKit

class LoginView: UIView {
 
    let emailView = {
       let emailView = UITextField()
        
        emailView.textColor = .black
        emailView.backgroundColor = UIColor (red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        emailView.placeholder = "email"
        emailView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        emailView.textAlignment = .center
        emailView.autocapitalizationType = .none
        emailView.autocorrectionType = .no
        emailView.translatesAutoresizingMaskIntoConstraints = false
        
        return emailView
    }()
    
    let passwordView = {
       let passwordView = UITextField()
        
        passwordView.textColor = .black
        passwordView.backgroundColor =  UIColor (red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        passwordView.placeholder = "password"
        passwordView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        passwordView.textAlignment = .center
        passwordView.autocapitalizationType = .none
        passwordView.isSecureTextEntry = true
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordView
    }()
    
    let loginButtonView = {
        
       let loginButtonView = UIButton()
        loginButtonView.backgroundColor = .black
        loginButtonView.setTitle("Entrar", for: .normal)
        loginButtonView.translatesAutoresizingMaskIntoConstraints = false
            
        return loginButtonView
    }()
    
    let errorMessageView = {
        
       let errorMessageView = UILabel()
        errorMessageView.textColor = .red
        errorMessageView.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        errorMessageView.numberOfLines = 0
        errorMessageView.translatesAutoresizingMaskIntoConstraints = false
        
        return errorMessageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        backgroundColor = .white

        addSubview(emailView)
        addSubview(passwordView)
        addSubview(loginButtonView)
        addSubview(errorMessageView)

        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: topAnchor, constant: 220),
            emailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailView.heightAnchor.constraint(equalToConstant: 50),
            
            passwordView.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            passwordView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordView.heightAnchor.constraint(equalToConstant: 50),
            
            loginButtonView.topAnchor.constraint(equalTo: topAnchor, constant: 420),
            loginButtonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButtonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginButtonView.heightAnchor.constraint(equalToConstant: 50),
            
            errorMessageView.topAnchor.constraint(equalTo: topAnchor, constant: 560),
            errorMessageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            errorMessageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            errorMessageView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
}
