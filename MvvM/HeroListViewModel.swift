//
//  HeroListViewModel.swift
//  DragonBallBase
//
//  Created by Pedro Martín on 16/1/23.
//

import Foundation

class HeroListViewModel: NSObject {
    
    override init() {
        
    }
    
    var updateUI: ((_ heroes: [HeroModel]) -> Void)?

    func fetchData() {
        
        let myToken = ""
        
        let apiClient = ApiClient(token: myToken)
        
        apiClient.getHeroes { [weak self] heroes, error in
            self?.updateUI?(heroes)
        }
    }
}



