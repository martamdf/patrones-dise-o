//
//  HeroesListViewController.swift
//  DragonBallBase
//
//  Created by Pedro Martín on 16/1/23.
//

import Foundation
import UIKit

class HeroesListViewController: UIViewController {
    
    var mainView: HeroesListView { self.view as! HeroesListView }
    var heroes: [HeroModel] = []
    
    var viewModel: HeroListViewModel?
    
    var tableViewDataSource: HeroesListTableViewDataSource?
    var tableViewDelegate: HeroesListTableViewDelegate?
    
    override func loadView() {
        view = HeroesListView()
        
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        mainView.heroesTableView.dataSource = tableViewDataSource
        
        tableViewDelegate = HeroesListTableViewDelegate()
        mainView.heroesTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HeroListViewModel()
        
        setUpUpdateUI()
        setUpTableDelegate()
        getData()
    }
    
    func setUpUpdateUI() {
        // PREPARÁNDOME PARA RECIBIR LOS DATOS QUE VIENE DEL VIEWMODEL
        viewModel?.updateUI = { [weak self] heroes in
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
        }
    }
    
    func getData() {
        // CALL API TO GET HERO LIST
        viewModel?.fetchData()
    }
    
    func setUpTableDelegate() {
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            
            guard let datasource = self?.tableViewDataSource else {
                return
            }
            
            // Get the hero in the hero list according to the position index
            let hero = datasource.heroes[index]
            
            // Prepare the viewcontroller that I want to present
            let heroDetailViewController = HeroDetailViewController(heroDetailModel: hero)
            
            // Present the controller to show the details
            
            self?.present(heroDetailViewController, animated: true)
            
        }
    }
}
