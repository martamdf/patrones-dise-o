//
//  Interactor.swift
//  DragonBallBase
//
//  Created by Pedro Martín on 17/1/23.
//

import Foundation

// object
// protocol
// ref to presenter
// api calls

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getHeroes()
}

class HeroInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getHeroes() {
        let myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InByaXZhdGUifQ.eyJpZGVudGlmeSI6IjEyMzlFNERBLTM3N0MtNERGMS1CRTEwLTY5QjVFODZDNzA4RSIsImVtYWlsIjoicG1nQHRlc3QuY29tIiwiZXhwaXJhdGlvbiI6NjQwOTIyMTEyMDB9.t-vay9I3gno6WHT0v7Tm7EJ4RPXZZjh3ZX6-nJEz33k"
 
        ApiClient(token: myToken).getHeroes { [weak self] heroes, error in
            if (error != nil) {
                self?.presenter?
                    .interactorDidFechHeroes(with: .failure(error!))
                
                return
            }
            
            self?.presenter?
                .interactorDidFechHeroes(with: .success(heroes))
        }
    }
    
    
}
