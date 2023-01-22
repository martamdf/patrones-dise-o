//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by Marta Maquedano on 20/1/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var mainView: LoginView {self.view as! LoginView}
    
    var emailTextfield : UITextField?
    var passwordTextfield : UITextField?
    var loginButton : UIButton?
    var errorMessageView: UILabel?
    var tokenResult: String?
    
    var viewModel: LoginViewModel?
    
    override func loadView() {
        let loginView = LoginView()
        
        loginButton = loginView.loginButtonView
        emailTextfield = loginView.emailView
        passwordTextfield = loginView.passwordView
        errorMessageView = loginView.errorMessageView
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        loginButton?.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
    }
    
    func setUpUpdateUI(){
        viewModel = LoginViewModel()
        viewModel?.updateStatus = { [weak self] tokenResult in
            DispatchQueue.main.async {
                self?.tokenResult = tokenResult
                self?.errorMessageView?.text = tokenResult
            }
        }
    }
    
    func getLogin(email: String, password: String){
        viewModel?.getToken(email: email, password: password, completion: { response in
            DispatchQueue.main.async {
                self.errorMessageView?.text = response
                self.setUpUpdateUI()
            }
        })
    }
    
    @objc func didLoginTapped(sender: UIButton!) {
        
        let apiClient = ApiClient()
        
        guard let email = emailTextfield?.text, !email.isEmpty else {
            print("Por favor, introduzca un correo electrónico.")
            return
        }
        guard let password = passwordTextfield?.text, !password.isEmpty else {
            print("Por favor, introduzca la contraseña.")
            return
        }
        
        self.getLogin(email: email, password: password)
        
        setUpUpdateUI()
    }
}
